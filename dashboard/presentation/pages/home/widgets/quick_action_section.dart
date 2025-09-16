import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class QuickActionSection extends StatelessWidget {
  const QuickActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: context.textTheme.s18w500.copyWith(
            color: AppColors.black,
          ),
        ),
        const VerticalSpacing(16),
        const QuickActionButtonWidget(
          icon: 'assets/images/chat.png',
          title: 'Instant message',
          subTitle: 'Compose a quick sms message',
        ),
        const VerticalSpacing(12),
        const QuickActionButtonWidget(
          icon: 'assets/images/sender.png',
          title: 'Sender ID',
          subTitle: 'Create a sender ID',
        ),
        const VerticalSpacing(12),
        const QuickActionButtonWidget(
          icon: 'assets/images/analytics.png',
          title: 'Analytics',
          subTitle: 'View message analytics',
        ),
      ],
    );
  }
}

class QuickActionButtonWidget extends StatelessWidget {
  const QuickActionButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});
  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.primaryF5F7F9,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(height: 32.h, width: 32.w, child: Image.asset(icon)),
              const HorizontalSpacing(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.s14w500.copyWith(
                      color: AppColors.primary141414,
                    ),
                  ),
                  const VerticalSpacing(3),
                  Text(
                    subTitle,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary676767,
                    ),
                  )
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/arrow_right.svg'),
        ],
      ),
    );
  }
}
