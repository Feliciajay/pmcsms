import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget(
      {super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.s11w300.copyWith(
            color: AppColors.primary494949,
          ),
        ),
        const VerticalSpacing(16),
        Column(
          children: children,
        )
      ],
    );
  }
}
