import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.date,
      required this.amount,
      required this.status});
  final String icon;
  final String title;
  final String date;
  final String amount;
  final String status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryD6ECE2,
                ),
                child: SvgPicture.asset(icon),
              ),
              const HorizontalSpacing(8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.s14w500.copyWith(
                        color: AppColors.primary141414,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const VerticalSpacing(2),
                    Text(
                      date,
                      style: context.textTheme.s12w400.copyWith(
                        color: AppColors.primary676767,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '+ $amount',
                style: context.textTheme.s14w500.copyWith(
                  color: AppColors.primary141414,
                ),
              ),
              const VerticalSpacing(2),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: status.toLowerCase() == 'pending'
                      ? AppColors.primaryE3AB1C.withValues(alpha: 0.15)
                      : AppColors.primary27AE60.withValues(alpha: 0.15),
                ),
                child: Text(
                  status,
                  style: context.textTheme.s12w400.copyWith(
                    color: status.toLowerCase() == 'pending'
                        ? AppColors.primaryE3AB1C
                        : AppColors.primary27AE60,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
