import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.titleWidget,
    this.leading,
    this.title,
    this.actions,
    this.elevation = 0,
    this.centerTitle,
    this.backgroundColor,
  });
  final Widget? titleWidget;
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final double elevation;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          (title != null
              ? Text(
                  title ?? '',
                  style: context.textTheme.s18w600.copyWith(
                    color: AppColors.black,
                  ),
                )
              : null),
      leading: leading ??
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/arrowleft.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
      centerTitle: centerTitle,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      elevation: elevation,
      iconTheme: const IconThemeData(color: AppColors.primarysWatch),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
