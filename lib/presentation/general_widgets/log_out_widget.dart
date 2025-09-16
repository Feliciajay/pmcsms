import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 19),
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/icons/cancel.svg')),
          ),
          const VerticalSpacing(15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryF2FCFF,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset('assets/icons/logout_icon.svg'),
          ),
          const VerticalSpacing(10),
          const Text(
            'Log out',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(12),
          Text(
            'Are you sure you want to log out?',
            style: context.textTheme.s14w400.copyWith(
              color: AppColors.primary494949,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(20),
          Row(
            children: [
              Expanded(
                child: AppSendButton(
                    onTap: () => Navigator.pop(context),

                    // buttonBorder:
                    //     Border.all(color: AppColors.primaryColor),
                    backgroundColor: AppColors.primaryF6F7F9,
                    title: 'No',
                    textColor: AppColors.primary191919),
              ),
              const HorizontalSpacing(10),
              Expanded(
                child: AppSendButton(
                    onTap: onTap,
                    backgroundColor: AppColors.primaryColor,
                    title: 'Yes',
                    textColor: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
