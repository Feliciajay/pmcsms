import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.title,
      required this.value,
      this.onTap,
      this.canEdit});
  final String title;
  final String value;
  final Function()? onTap;
  final bool? canEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.s14w400.copyWith(
                color: AppColors.primary494949,
              ),
            ),
            const VerticalSpacing(12),
            SizedBox(
              width: 200,
              child: Text(
                value,
                style: context.textTheme.s14w400.copyWith(
                  color: AppColors.primary141414,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (canEdit ?? true)
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.21,
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  color: AppColors.primaryECF1F8,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/edit.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const HorizontalSpacing(5),
                  Text(
                    'Edit',
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
