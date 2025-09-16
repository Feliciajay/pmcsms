import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AppOptionsButtonWidget extends StatelessWidget {
  const AppOptionsButtonWidget(
      {super.key,
      required this.iconContainerColor,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.containerColor,
      this.onTap});
  final Color iconContainerColor;
  final Color containerColor;
  final String icon;
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: iconContainerColor, shape: BoxShape.circle),
                  child: SvgPicture.asset(icon),
                ),
                const HorizontalSpacing(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.s16w500.copyWith(
                        color: AppColors.primary1C1C1C,
                      ),
                    ),
                    SizedBox(
                      width: 230.w,
                      child: Text(
                        subTitle,
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.primary676767,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SvgPicture.asset('assets/icons/arrow_right.svg')
          ],
        ),
      ),
    );
  }
}
