import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/buy_unit/presentation/view/buy_unit_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/notifier/get_balance_notifier.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/notifier/hide_balance_provider.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/recent_transaction_section.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class SmsComponent extends ConsumerStatefulWidget {
  const SmsComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SmsComponentState();
}

class _SmsComponentState extends ConsumerState<SmsComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getWalletBalanceNotifier.notifier).getWalletBalance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smsBalance = ref.watch(getWalletBalanceNotifier.select((v) {
      final balanceList = v.getBalanceResponse?.data?.balance
          ?.where((e) => e.name?.toLowerCase() == 'bulksms balance')
          .map((e) => e.value)
          .toSet()
          .toList();

      if (balanceList != null && balanceList.isNotEmpty) {
        // Assuming balanceList contains a single value like "(1000.00)"
        final balanceString = balanceList.first;
        // Remove parentheses and trim any whitespace
        final cleanedBalance =
            balanceString?.replaceAll(RegExp(r'[()]'), '').trim();
        return cleanedBalance;
      }

      return null; // or a default value if no balance is found
    }));
    final hideBalance = ref.watch(hideBalanceProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 80),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryFEFFEB,
                    borderRadius: BorderRadius.circular(58),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/sms.svg'),
                      const HorizontalSpacing(5),
                      Text(
                        'SMS Balance',
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.primary1C1C1C,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${hideBalance ? '****' : smsBalance} Units',
                      style: context.textTheme.s20w600.copyWith(
                        color: AppColors.primary141414,
                      ),
                    ),
                    const HorizontalSpacing(5),
                    GestureDetector(
                      onTap: () {
                        ref.read(hideBalanceProvider.notifier).state =
                            !hideBalance;
                      },
                      child: Icon(
                          hideBalance
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.primary141414,
                          size: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
          const VerticalSpacing(20),
          AppSendButton(
            onTap: () => context.pushNamed(BuyUnitView.routeName),
            title: 'Buy Unit',
            icon: 'assets/icons/add.svg',
          ),
          const VerticalSpacing(40),
          const RecentTransactionSection(
            walletList: [],
          )
        ],
      ),
    );
  }
}
