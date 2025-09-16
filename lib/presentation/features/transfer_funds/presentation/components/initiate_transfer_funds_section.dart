import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/model/transfer_funds_request.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/components/confirm_transfer_bottomsheet.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/notifier/transfer_funds_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/amount_textfield.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_pin_input_field.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class InitiateTransferFundsSection extends ConsumerStatefulWidget {
  const InitiateTransferFundsSection({super.key, required this.email});

  final String email;

  @override
  ConsumerState<InitiateTransferFundsSection> createState() =>
      _InitiateTransferFundsSectionState();
}

class _InitiateTransferFundsSectionState
    extends ConsumerState<InitiateTransferFundsSection> {
  final ValueNotifier<bool> _isTransferEnabled = ValueNotifier(false);

  late TextEditingController _amountController;
  final _pinController = TextEditingController();

  @override
  void initState() {
    _amountController = TextEditingController()..addListener(_validateInput);

    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
  }

  void _validateInput() {
    _isTransferEnabled.value = _amountController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final initials = widget.email.substring(0, 2);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.primaryF5F7F9,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Recent',
            style: context.textTheme.s16w600.copyWith(
              color: AppColors.primary141414,
            ),
          ),
          const VerticalSpacing(20),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryF1BD6C,
                child: Text(initials.toUpperCase()),
              ),
              const HorizontalSpacing(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.email,
                    style: context.textTheme.s14w500.copyWith(
                      color: AppColors.primary1C1C1C,
                    ),
                  ),
                  Text(
                    widget.email,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary676767,
                    ),
                  )
                ],
              )
            ],
          ),
          const VerticalSpacing(24),
          Text(
            'Amount (NGN)',
            style: context.textTheme.s16w600.copyWith(
              color: AppColors.primary141414,
            ),
          ),
          const VerticalSpacing(16),
          AmountTextField(
            amountController: _amountController,
            containerColor: AppColors.white,
            hintText: '100.0 - 500,000',
          ),
          const VerticalSpacing(24),
          ValueListenableBuilder(
              valueListenable: _isTransferEnabled,
              builder: (context, re, c) {
                return AppSendButton(
                  isEnabled: re,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return ConfirmTransferBottomsheet(
                            amount: _amountController.text,
                            recipent: widget.email,
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return CustomPinInputField(
                                        onCompleted: () {
                                          _transferFunds(
                                              _pinController.text.trim());
                                          _pinController.clear();
                                        },
                                        pinController: _pinController);
                                  });
                            },
                          );
                        });
                  },
                  title: 'Transfer',
                );
              }),
          const VerticalSpacing(12),
        ],
      ),
    );
  }

  void _transferFunds(String pin) {
    final data = TransferFundsRequest(
        process: 'pm_wallet',
        action: 'transfer_fund',
        walletType: 'sms',
        username: widget.email,
        amount: int.parse(_amountController.text.trim()),
        transactPin: _pinController.text.trim());

    ref.read(transferFundsNotifier.notifier).transferFunds(
        data: data,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: message);
          context.pop();
        });
  }
}
