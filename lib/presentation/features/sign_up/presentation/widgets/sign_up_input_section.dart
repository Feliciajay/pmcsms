import 'package:flutter/material.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_email_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_form_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_password_field.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection(
      {super.key,
      required this.emailController,
      required this.firstNameController,
      required this.lastNameController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.userNameController,
      required this.phoneNumberController});
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController userNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFormField(
          label: 'First name',
          controller: firstNameController,
        ),
        const VerticalSpacing(24),
        AppFormField(
          label: 'Last name',
          controller: lastNameController,
        ),
        const VerticalSpacing(24),
        AppFormField(
          label: 'User name',
          controller: userNameController,
        ),
        const VerticalSpacing(24),
        AppEmailField(
          label: 'Email',
          hintText: 'e.g johndoe@gmail.com',
          backgroundColor: AppColors.white,
          controller: emailController,
        ),
        const VerticalSpacing(24),
        AppFormField(
          label: 'Phone number',
          controller: phoneNumberController,
          keyboardType: TextInputType.number,
          maxLength: 11,
          prefixIcon: const Icon(Icons.phone_android),
        ),
        const VerticalSpacing(24),
        AppPasswordField(
          label: 'Password',
          controller: passwordController,
        ),
        const VerticalSpacing(24),
        AppPasswordField(
          label: 'Confirm Password',
          controller: confirmPasswordController,
        )
      ],
    );
  }
}
