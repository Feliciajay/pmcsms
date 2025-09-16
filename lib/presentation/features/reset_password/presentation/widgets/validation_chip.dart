import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ValidationChip extends StatelessWidget {
  final String text;
  final bool isValid;

  const ValidationChip({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryF7F7F7,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.primary545962,
              fontSize: 11,
            ),

            // ),
          ),
          if (isValid) ...[
            const HorizontalSpacing(8),
            SvgPicture.asset('assets/icons/password_tick.svg'),
          ],
        ],
      ),
    );
  }
}
