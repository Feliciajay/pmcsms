import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/dashboard.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/confirm_payment_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/notifier/confirm_fund_account_online_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class FundAccountValidationScreen extends ConsumerStatefulWidget {
  const FundAccountValidationScreen({
    super.key,
    required this.transactionId,
  });

  final String transactionId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FundAccountValidationScreenState();
}

class _FundAccountValidationScreenState
    extends ConsumerState<FundAccountValidationScreen> {
  late final ConfirmPaymentRequest data;

  @override
  void initState() {
    data = ConfirmPaymentRequest(
        process: 'pm_wallet',
        action: 'confirm_payment',
        transactionId:
            widget.transactionId // Now correctly accessing the widget property
        );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(confirmFundAccountOnlineNotifier.notifier)
          .confirmFundAccountOnline(
              data: data,
              onError: (error) {
                context.showError(message: error);
              },
              onSuccess: (message) {
                context.showSuccess(message: message);
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    final message = ref.watch(confirmFundAccountOnlineNotifier.select(
        (v) => v.confirmFundAccountOnlineResponse?.data?.serverMessage));

    final isLoading = ref.watch(confirmFundAccountOnlineNotifier
        .select((v) => v.confirmFundAccountOnlineState.isLoading));
    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 200),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 67.h,
                      width: 67.w,
                      child: Image.asset('assets/images/verify_image.png'),
                    ),
                    const VerticalSpacing(30),
                    Text(
                      message ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacing(70),
                    AppSendButton(
                      onTap: () {
                        context.pushReplacementNamed(Dashboard.routeName);
                      },
                      width: double.infinity,
                      title: 'Go to Home',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
