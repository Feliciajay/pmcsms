import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/view/initiate_funds_transfer_view.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class RecipientSection extends StatefulWidget {
  const RecipientSection({
    super.key,
  });

  @override
  State<RecipientSection> createState() => _RecipientSectionState();
}

class _RecipientSectionState extends State<RecipientSection> {
  final ValueNotifier<bool> _isTransferEnabled = ValueNotifier(false);

  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController()..addListener(_validateInput);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  void _validateInput() {
    _isTransferEnabled.value = _emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
          color: AppColors.primaryF5F7F9,
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Recipient',
          style: context.textTheme.s16w600.copyWith(
            color: AppColors.primary141414,
          ),
        ),
        const VerticalSpacing(10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Enter Username or email',
                  hintStyle: context.textTheme.s14w400.copyWith(
                    color: AppColors.primary979797,
                  ),
                  border: InputBorder.none)),
        ),
        const VerticalSpacing(30),
        ValueListenableBuilder(
            valueListenable: _isTransferEnabled,
            builder: (context, re, c) {
              return AppSendButton(
                  isEnabled: re,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InitiateFundsTransferView(
                          email: _emailController.text.trim(),
                        ),
                      ),
                    );
                  },
                  title: 'Proceed');
            })
      ]),
    );
  }
}
