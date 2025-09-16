import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.isLoggout = false,
      this.onTap});
  final String icon;
  final String title;
  final Function()? onTap;
  final bool isLoggout;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(delay: Duration(microseconds: 300)),
        ScaleEffect(curve: Curves.bounceInOut),
      ],
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        title: Text(
          title,
          style: context.textTheme.s14w500.copyWith(
            color: isLoggout ? AppColors.red : AppColors.primary1C1C1C,
          ),
        ),
        leading: SvgPicture.asset(icon),
      ),
    );
  }
}
