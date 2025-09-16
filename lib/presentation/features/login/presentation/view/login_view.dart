import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/dashboard.dart';
import 'package:pmcsms/presentation/features/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_request.dart';
import 'package:pmcsms/presentation/features/login/presentation/notifier/login_notifer.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:pmcsms/presentation/general_widgets/app_email_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_password_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/social_media_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static const routeName = '/loginView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);

  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController()..addListener(_validateInput);

    _passwordController = TextEditingController()..addListener(_validateInput);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  void _validateInput() {
    _isLoginEnabled.value =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(loginNotifier.select((v) => v.loginState.isLoading));
    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 22,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Welcome Back!',
                  style: context.textTheme.s24w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              const VerticalSpacing(8),
              Text(
                'Let\'s get you back to sending those messages',
                style: context.textTheme.s12w400.copyWith(
                  color: AppColors.primary494949,
                ),
              ),
              const VerticalSpacing(32),
              SocialMediaButton(
                hasBorder: true,
                onTap: () {},
                icon: 'assets/icons/google.svg',
                title: 'Continue with Google',
              ),
              const VerticalSpacing(16),
              SocialMediaButton(
                hasBorder: true,
                onTap: () {},
                icon: 'assets/icons/facebook.svg',
                title: 'Continue with facebook',
              ),
              const VerticalSpacing(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 135.w,
                    child: const Divider(
                      color: AppColors.primaryE8E8E8,
                    ),
                  ),
                  const HorizontalSpacing(10),
                  Text(
                    'OR',
                    style: context.textTheme.s14w400.copyWith(
                      color: AppColors.primary191919,
                    ),
                  ),
                  const HorizontalSpacing(10),
                  SizedBox(
                    width: 135.w,
                    child: const Divider(
                      color: AppColors.primaryE8E8E8,
                    ),
                  ),
                ],
              ),
              AppEmailField(
                label: 'Email/Username',
                hintText: 'e.g johndoe@gmail.com',
                backgroundColor: AppColors.white,
                controller: _emailController,
              ),
              const VerticalSpacing(24),
              AppPasswordField(
                label: 'Password',
                controller: _passwordController,
              ),
              const VerticalSpacing(16),
              GestureDetector(
                onTap: () => context.pushNamed(ForgotPasswordView.routeName),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot password',
                    style: context.textTheme.s12w500.copyWith(
                        color: AppColors.primaryE3AB1C,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryE3AB1C),
                  ),
                ),
              ),
              const VerticalSpacing(32),
              ValueListenableBuilder(
                  valueListenable: _isLoginEnabled,
                  builder: (context, re, c) {
                    return AppSendButton(
                        isEnabled: re,
                        onTap: () {
                          _login();
                        },
                        title: 'Log in');
                  }),
              const VerticalSpacing(24),
              RichText(
                  text: TextSpan(
                      text: 'New to PMCSMS? ',
                      style: context.textTheme.s12w500.copyWith(
                        color: AppColors.primary494949,
                      ),
                      children: [
                    TextSpan(
                        text: 'Sign up',
                        style: context.textTheme.s12w500.copyWith(
                            color: AppColors.primaryE3AB1C,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryE3AB1C),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(SignUpView.routeName);
                          }),
                  ])),
            ],
          ),
        )),
      ),
    );
  }

  void _login() {
    ref.read(loginNotifier.notifier).login(
          data: LoginRequest(
            process: 'pm_auth',
            action: 'login_user',
            userinfo: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context.hideOverLay();
            context.showSuccess(message: message);
            context.pushReplacementNamed(Dashboard.routeName);
          },
        );
  }
}
