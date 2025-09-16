import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
              color: AppColors.primaryE6E6E6,
              borderRadius: BorderRadius.circular(8)),
          child: SvgPicture.asset('assets/icons/empty_list.svg'),
        ),
        const VerticalSpacing(16),
        Text(
          text,
          style: context.textTheme.s12w400.copyWith(
            color: AppColors.primary494949,
          ),
        )
      ],
    );
  }
}
