import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/forgot_password_request.dart';
import 'package:pmcsms/presentation/features/forgot_password/presentation/notifier/forgot_password_notifier.dart';
import 'package:pmcsms/presentation/features/forgot_password/presentation/view/verify_forgot_password_otp.dart';
import 'package:pmcsms/presentation/general_widgets/app_email_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = '/forgotPassword';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final ValueNotifier<bool> _isForgotEnabled = ValueNotifier(false);

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
    _isForgotEnabled.value = _emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
        forgotPasswordNotifier.select((v) => v.forgotPasswordState.isLoading));
    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Forgot Password',
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'We got you covered. Enter your account email address and we will send you a reset code',
                style: context.textTheme.s12w400.copyWith(
                  color: AppColors.primary494949,
                ),
              ),
              const VerticalSpacing(34),
              AppEmailField(
                label: 'Email',
                hintText: 'e.g johndoe@gmail.com',
                backgroundColor: AppColors.white,
                controller: _emailController,
              ),
              const VerticalSpacing(24),
              ValueListenableBuilder(
                  valueListenable: _isForgotEnabled,
                  builder: (context, re, c) {
                    return AppSendButton(
                        isEnabled: re,
                        onTap: () {
                          _forgotPassword();
                        },
                        title: 'Send reset code');
                  }),
            ],
          ),
        )),
      ),
    );
  }

  void _forgotPassword() {
    ref.read(forgotPasswordNotifier.notifier).forgotPassword(
          data: ForgotPasswordRequest(
              process: 'pm_auth',
              action: 'initiate_forgot_password',
              email: _emailController.text.trim()),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context.hideOverLay();
            context.showSuccess(message: message);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => VerifyForgotPasswordOtp(
                          email: _emailController.text.trim(),
                        )));
          },
        );
  }
}
