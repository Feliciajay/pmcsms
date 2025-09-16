import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/account_set_up_section.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class CompleteSetupSection extends StatelessWidget {
  const CompleteSetupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(delay: Duration(milliseconds: 1000)),
        ScaleEffect(curve: Curves.easeIn),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryFCFFF0,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryF4F67D,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/caution.svg'),
                const HorizontalSpacing(13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Finish setting up your account to start sending your messages',
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.primary1C1C1C,
                        ),
                      ),
                      const VerticalSpacing(12),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return const AccountSetUpSection();
                              });
                        },
                        child: Container(
                          width: 200.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.primaryE8E8E8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Complete account set up',
                                style: context.textTheme.s12w500.copyWith(
                                  color: AppColors.primary1A1A1A,
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/icons/arrow_forward.svg'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
