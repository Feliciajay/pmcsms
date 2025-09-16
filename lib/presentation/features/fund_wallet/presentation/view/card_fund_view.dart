import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/fund_account_online_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/components/payment_gateway_page.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/notifier/fund_account_online_notifier.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';
import 'package:pmcsms/presentation/general_widgets/amount_textfield.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class CardFundView extends ConsumerStatefulWidget {
  const CardFundView({super.key});
  static const String routeName = '/cardFund';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardFundViewState();
}

class _CardFundViewState extends ConsumerState<CardFundView> {
  final ValueNotifier<bool> _isCardFundEnabled = ValueNotifier(false);

  late TextEditingController _amountController;

  LoginResponse? response;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ref.watch(fundAccountOnlineNotifier);
    });
    getAccountDetails();
    _amountController = TextEditingController()..addListener(_validateInput);
    super.initState();
  }

  String? selectedService;
  String? selectedPaymentPlatform;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _validateInput() {
    _isCardFundEnabled.value = _amountController.text.isNotEmpty;
  }

  getAccountDetails() async {
    final loginResponse = await SecureStorage().getLoginResponse();

    setState(() {
      response = loginResponse;
    });
  }

  AtmProvider? selectedAvailableServiceName;
  // AtmProvider? selectedService;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(fundAccountOnlineNotifier
        .select((v) => v.fundAccountOnlineState.isLoading));

    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Card Payment',
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount (NGN)',
                style: context.textTheme.s14w400
                    .copyWith(color: AppColors.primary0C0C0C),
              ),
              const VerticalSpacing(8),
              AmountTextField(
                amountController: _amountController,
                hintText: '',
              ),
              const VerticalSpacing(29),
              Text(
                'Pay Via',
                style: context.textTheme.s14w400
                    .copyWith(color: AppColors.primary0C0C0C),
              ),
              const VerticalSpacing(8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryE8E8E8)),
                child: DropdownButton<AtmProvider>(
                  dropdownColor: Colors.white,
                  elevation: 0,
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  value: selectedAvailableServiceName,
                  hint: const Text('Choose Service Type'),
                  items: response?.data?.websiteData?.atmProviders!
                          .map((serviceName) => DropdownMenuItem<AtmProvider>(
                                value: serviceName,
                                child: Text(serviceName.name.toString()),
                              ))
                          .toList() ??
                      [],
                  onChanged: (AtmProvider? newServiceName) {
                    setState(() {
                      selectedAvailableServiceName = newServiceName;
                      selectedService = null;
                      selectedPaymentPlatform = newServiceName?.slug;
                    });
                  },
                ),
              ),
              const VerticalSpacing(33),
              ValueListenableBuilder(
                  valueListenable: _isCardFundEnabled,
                  builder: (context, re, c) {
                    return AppSendButton(
                      isEnabled: re,
                      onTap: () {
                        if (selectedPaymentPlatform == null) {
                          context.showError(
                              message: 'Pls select payment platform');
                        } else {
                          _fundAccountOnline();
                        }
                      },
                      title: 'Proceed',
                    );
                  })
            ],
          ),
        )),
      ),
    );
  }

  void _fundAccountOnline() {
    ref.read(fundAccountOnlineNotifier.notifier).fundAccountOnline(
          data: FundAccountOnlineRequest(
              process: 'pm_wallet',
              action: 'fund_online',
              amount: _amountController.text.trim(),
              channel: "$selectedPaymentPlatform"),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message, paymentUrls, transactionId) {
            context.hideOverLay();
            context.showSuccess(message: message);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PaymentGatewayScreen(
                          paymentUrl: paymentUrls,
                          transactionId: transactionId,
                        )));
          },
        );
  }
}
