import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_request.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/notifier/sign_up_notifier.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/widgets/sign_up_input_section.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/view/verify_email.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/social_media_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign_up_view';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final ValueNotifier<bool> _isSignUpEnabled = ValueNotifier(false);
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _userNameController;
  late TextEditingController _lastNameController;

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneNumberController;

  @override
  void dispose() {
    _firstNameController.dispose();
    _userNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController()..addListener(_validateInput);
    _userNameController = TextEditingController()..addListener(_validateInput);
    _lastNameController = TextEditingController()..addListener(_validateInput);
    _emailController = TextEditingController()..addListener(_validateInput);
    _phoneNumberController = TextEditingController()
      ..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
    _confirmPasswordController = TextEditingController()
      ..addListener(_validateInput);
  }

  void _validateInput() {
    _isSignUpEnabled.value = _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _userNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(signUpNotifier.select((v) => v.signUpState.isLoading));
    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 22,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome!',
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
                const VerticalSpacing(32),
                SignUpInputSection(
                  emailController: _emailController,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  userNameController: _userNameController,
                  phoneNumberController: _phoneNumberController,
                ),
                const VerticalSpacing(16),
                RichText(
                    text: TextSpan(
                        text:
                            'By clicking “continue with google, Facebook or signup” you agree to our ',
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.primary494949,
                        ),
                        children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.primaryE3AB1C,
                        ),
                      ),
                    ])),
                const VerticalSpacing(32),
                ValueListenableBuilder(
                    valueListenable: _isSignUpEnabled,
                    builder: (context, re, c) {
                      return AppSendButton(
                          isEnabled: re,
                          onTap: () {
                            _signUp();
                          },
                          title: 'Sign Up');
                    }),
                const VerticalSpacing(24),
                RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.primary494949,
                        ),
                        children: [
                      TextSpan(
                          text: 'Log in',
                          style: context.textTheme.s12w500.copyWith(
                              color: AppColors.primaryE3AB1C,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryE3AB1C),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(LoginView.routeName);
                            }),
                    ])),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void _signUp() {
    ref.read(signUpNotifier.notifier).signUp(
          data: SignUpRequest(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            phone: _phoneNumberController.text.trim(),
            process: 'pm_auth',
            username: _userNameController.text.trim(),
            confirmPassword: _confirmPasswordController.text.trim(),
            country: '160',
            referral: '',
            action: 'register',
          ),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: (message) {
            context
              ..hideOverLay()
              ..showSuccess(message: message)
              ..pushNamed(VerifyEmail.routeName);
          },
        );
  }
}
