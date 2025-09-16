import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/model/buy_unit_request.dart';
import 'package:pmcsms/presentation/features/buy_unit/presentation/notifier/buy_unit_notifier.dart';
import 'package:pmcsms/presentation/features/buy_unit/presentation/view/buy_unit_confirmation_view.dart';
import 'package:pmcsms/presentation/general_widgets/amount_textfield.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/custom_pin_input_field.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class BuyUnitView extends ConsumerStatefulWidget {
  const BuyUnitView({super.key});
  static const String routeName = '/buyUnitView';

  @override
  ConsumerState<BuyUnitView> createState() => _BuyUnitViewState();
}

class _BuyUnitViewState extends ConsumerState<BuyUnitView> {
  final ValueNotifier<bool> _isCardFundEnabled = ValueNotifier(false);

  late TextEditingController _amountController;
  final _pinController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ref.watch(fundAccountOnlineNotifier);
    });

    _amountController = TextEditingController()..addListener(_validateInput);
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _validateInput() {
    _isCardFundEnabled.value = _amountController.text.isNotEmpty;
  }

  String? _selectedUnit;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(buyUnitNotifier.select((v) => v.state.isLoading));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Buy Unit',
      ),
      body: PageLoader(
        isLoading: isLoading,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unit',
                  style: context.textTheme.s14w400.copyWith(
                    color: AppColors.primary141414,
                  ),
                ),
                const VerticalSpacing(8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryE8E8E8,
                    ),
                  ),
                  child: DropdownButton(
                    hint: const Text('Select unit type'),
                    value: _selectedUnit,
                    underline: const SizedBox(),
                    elevation: 0,
                    isExpanded: true,
                    items: unitTypes
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedUnit = value;
                      });
                    },
                  ),
                ),
                const VerticalSpacing(18),
                Text(
                  'Amount',
                  style: context.textTheme.s14w400.copyWith(
                    color: AppColors.primary141414,
                  ),
                ),
                const VerticalSpacing(8),
                AmountTextField(
                  amountController: _amountController,
                  hintText: 'Enter amount',
                ),
                const VerticalSpacing(32),
                ValueListenableBuilder(
                    valueListenable: _isCardFundEnabled,
                    builder: (context, re, c) {
                      return AppSendButton(
                        isEnabled: re,
                        onTap: () {
                          if (_selectedUnit == null) {
                            context.showError(message: 'Pls select a unit');
                          } else {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return BuyUnitConfirmationView(
                                    amount: _amountController.text,
                                    recipent: _selectedUnit ?? '',
                                    onTap: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (_) {
                                            return CustomPinInputField(
                                                onCompleted: () {
                                                  _buyUnit(_pinController.text
                                                      .trim());
                                                  _pinController.clear();
                                                },
                                                pinController: _pinController);
                                          });
                                    },
                                  );
                                });
                          }
                        },
                        title: 'Proceed',
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _buyUnit(String pin) {
    final data = BuyUnitRequest(
        process: 'pm_wallet',
        action: 'buy_unit',
        walletType: '$_selectedUnit',
        amount: int.parse(_amountController.text.trim()),
        transactPin: _pinController.text.trim());

    ref.read(buyUnitNotifier.notifier).buyUnit(
        data: data,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: message);
        });
  }
}

final List<String> unitTypes = [
  'SMS',
  'Email',
  'Voice SMS',
  'Whatsapp',
];
