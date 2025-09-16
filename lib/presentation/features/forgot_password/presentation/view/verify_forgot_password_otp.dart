import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/verify_otp_request.dart';
import 'package:pmcsms/presentation/features/forgot_password/presentation/notifier/verify_otp_notifier.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/resend_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/notifier/resend_otp_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/send_otp_field.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class VerifyForgotPasswordOtp extends ConsumerStatefulWidget {
  const VerifyForgotPasswordOtp({super.key, required this.email});
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyForgotPasswordOtpState();
}

class _VerifyForgotPasswordOtpState
    extends ConsumerState<VerifyForgotPasswordOtp> {
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
    _isVerifyEnabled.value =
        _codeController.text.isNotEmpty && _codeController.text.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    final isResendLoading =
        ref.watch(resendOtpNotifier.select((v) => v.resendOtpState.isLoading));

    final isVerifyOtpLoading =
        ref.watch(verifyOtpNotifier.select((v) => v.verifyOtpState.isLoading));
    return PageLoader(
      isLoading: isVerifyOtpLoading,
      child: PageLoader(
        isLoading: isResendLoading,
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Enter Code',
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'We sent a 6-digit code to you at ',
                      style: context.textTheme.s12w500.copyWith(
                        color: AppColors.primary494949,
                      ),
                      children: [
                        TextSpan(
                          text: "${widget.email}.",
                          style: context.textTheme.s12w600.copyWith(
                            color: AppColors.primary191919,
                          ),
                        ),
                        TextSpan(
                          text: ' Enter it below to continue',
                          style: context.textTheme.s12w400.copyWith(
                            color: AppColors.primary191919,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(32),
                  SendOtpField(
                    controller: _codeController,
                  ),
                  const VerticalSpacing(32),
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
            ),
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
    ref.read(verifyOtpNotifier.notifier).verifyOtp(
          data: VerifyOtpRequest(
            process: 'pm_verification',
            action: 'verify_otp',
            otpCode: _codeController.text.trim(),
            email: widget.email,
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context.hideOverLay();
            context.showSuccess(message: message);
            context.pushReplacementNamed(LoginView.routeName);
          },
        );
  }

  void _resendOtp() {
    ref.read(resendOtpNotifier.notifier).resendOtp(
          data: ResendOtpRequest(
            process: 'pm_auth',
            action: 'resend_otp',
            email: widget.email,
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
