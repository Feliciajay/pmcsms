import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ResetPasswordSuccessView extends StatelessWidget {
  const ResetPasswordSuccessView({super.key});
  static const String routeName = '/resetPasswordSuccessView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 84.h,
              width: 84.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryF0FFF4,
              ),
              child: SvgPicture.asset(
                'assets/icons/check.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpacing(32),
            Text(
              'Success!',
              style: context.textTheme.s32w600.copyWith(
                color: AppColors.black,
              ),
            ),
            const VerticalSpacing(8),
            Text(
              'Your password has been updated. Log in to proceed',
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary494949,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing(40),
            AppSendButton(
                onTap: () {
                  context.pushReplacementNamed(LoginView.routeName);
                },
                title: 'Log in')
          ],
        ),
      )),
    );
  }
}
