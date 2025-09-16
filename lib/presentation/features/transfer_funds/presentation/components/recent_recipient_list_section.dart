import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/empty_list_widget.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class RecentRecipientListSection extends StatelessWidget {
  const RecentRecipientListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.primaryF5F7F9,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Recent',
            style: context.textTheme.s16w600.copyWith(
              color: AppColors.primary141414,
            ),
          ),
          const VerticalSpacing(20),
          const Center(
            child: EmptyListWidget(
              text: 'You have no recent transfer',
            ),
          ),
        ],
      ),
    );
  }
}
