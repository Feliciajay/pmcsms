import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/space_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard(
      {super.key,
      required this.message,
      required this.onRetry,
      this.h = 100,
      this.buttonWidth = double.infinity});

  final String message;
  final VoidCallback onRetry;
  final double h, buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          h.hSpace,
          Text(
            message,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.red,
            ),
          ),
          SizedBox(height: 20.h),
          AppSendButton(
            width: buttonWidth,
            title: 'Retry',
            onTap: onRetry,
          )
        ],
      ),
    );
  }
}
