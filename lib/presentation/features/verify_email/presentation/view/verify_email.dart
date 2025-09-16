import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';

import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/notifier/sign_up_notifier.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/view/sign_up_success_view.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/resend_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/verify_signup_email_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/notifier/resend_otp_notifier.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/notifier/verify_otp_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/send_otp_field.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class VerifyEmail extends ConsumerStatefulWidget {
  const VerifyEmail({super.key});
  static const String routeName = '/verify_email';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  final ValueNotifier<bool> _isVerifyEnabled = ValueNotifier(false);

  late TextEditingController _codeController;
  @override
  dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _codeController = TextEditingController()..addListener(_validateInput);
    super.initState();
  }

  void _validateInput() {
    _isVerifyEnabled.value = _codeController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final email =
        ref.watch(signUpNotifier.select((v) => v.signUpResponse.data?.email));
    final isLoading =
        ref.watch(verifyOtpNotifier.select((v) => v.verifyOtpState.isLoading));

    final isResendLoading =
        ref.watch(resendOtpNotifier.select((v) => v.resendOtpState.isLoading));
    return PageLoader(
      isLoading: isResendLoading,
      child: PageLoader(
        isLoading: isLoading,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Verification',
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'We sent a 6-digit code to you at ',
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary494949,
                    ),
                    children: [
                      TextSpan(
                        text: '$email. ',
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.primary191919,
                        ),
                      ),
                      TextSpan(
                        text: 'Enter it below to continue',
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.primary494949,
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalSpacing(32),
                SendOtpField(
                  controller: _codeController,
                ),
                const VerticalSpacing(40),
                ValueListenableBuilder(
                    valueListenable: _isVerifyEnabled,
                    builder: (context, re, c) {
                      return AppSendButton(
                          isEnabled: re,
                          onTap: () {
                            _verifyOtp();
                          },
                          title: 'Verify');
                    }),
                const VerticalSpacing(24),
                RichText(
                    text: TextSpan(
                        text: 'Didn\'t get code? ',
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.primary494949,
                        ),
                        children: [
                      TextSpan(
                          text: 'Resend Code',
                          style: context.textTheme.s12w500.copyWith(
                            color: AppColors.primaryE3AB1C,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _resendOtp();
                            }),
                    ])),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void _verifyOtp() {
    final email =
        ref.watch(signUpNotifier.select((v) => v.signUpResponse.data?.email));
    ref.read(verifyOtpNotifier.notifier).verifyOtp(
          data: VerifySignupEmailOtpRequest(
            process: 'pm_auth',
            action: 'activate_account_otp',
            otpCode: _codeController.text.trim(),
            email: '$email',
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context.hideOverLay();
            context.showSuccess(message: message);
            context.pushReplacementNamed(SignUpSuccessView.routeName);
          },
        );
  }

  void _resendOtp() {
    final email =
        ref.watch(signUpNotifier.select((v) => v.signUpResponse.data?.email));
    ref.read(resendOtpNotifier.notifier).resendOtp(
          data: ResendOtpRequest(
            process: 'pm_auth',
            action: 'resend_otp',
            email: '$email',
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context.hideOverLay();
            context.showSuccess(message: message);
          },
        );
  }
}
