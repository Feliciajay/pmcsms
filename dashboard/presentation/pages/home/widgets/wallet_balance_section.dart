import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/notifier/get_balance_notifier.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/notifier/hide_balance_provider.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalletBalanceSection extends ConsumerStatefulWidget {
  const WalletBalanceSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletBalanceSectionState();
}

class _WalletBalanceSectionState extends ConsumerState<WalletBalanceSection> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getWalletBalanceNotifier.notifier).getWalletBalance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final balance =
        ref.watch(getWalletBalanceNotifier.select((v) => v.getBalanceResponse));
    final hideBalance = ref.watch(hideBalanceProvider);
    return Animate(
      effects: const [
        FadeEffect(delay: Duration(milliseconds: 1000)),
      ],
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 14,
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.black.withValues(alpha: 0.03),
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(2, 10)),
            ]),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: _pageController,
            children:
                List.generate(balance?.data?.balance?.length ?? 0, (index) {
              final data = balance?.data?.balance?[index];
              return Column(
                children: [
                  Container(
                    width: 170.w,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryEBF2FF,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/wallet.svg'),
                        const HorizontalSpacing(5),
                        Text(
                          '${data?.name}',
                          style: context.textTheme.s12w400.copyWith(
                            color: AppColors.primary1C1C1C,
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacing(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data?.currency} ${hideBalance ? data?.value : "******"}',
                        style: context.textTheme.s20w600.copyWith(
                          color: AppColors.primary141414,
                        ),
                      ),
                      const HorizontalSpacing(12),
                      GestureDetector(
                          onTap: () {
                            ref.read(hideBalanceProvider.notifier).state =
                                !hideBalance;
                          },
                          child: SvgPicture.asset(hideBalance
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/eye-slash.svg')),
                    ],
                  ),
                  const VerticalSpacing(16),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: balance?.data?.balance?.length ?? 0,
                      effect: const ExpandingDotsEffect(
                          dotHeight: 3,
                          dotWidth: 7,
                          radius: 5,
                          activeDotColor: AppColors.primary676767,
                          dotColor: AppColors.primaryD9D9D9),
                    ),
                  ),
                  const VerticalSpacing(16),
                  Divider(
                    color: AppColors.primaryE8E8E8.withOpacity(0.55),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View history',
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.primary494949,
                        ),
                      ),
                      const HorizontalSpacing(4),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: AppColors.primary494949,
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
