import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_response.dart';
import 'package:pmcsms/presentation/features/transactions/presentation/view/transaction_view.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';
import 'package:pmcsms/presentation/general_widgets/transaction_widget.dart';

class RecentTransactionSection extends ConsumerStatefulWidget {
  const RecentTransactionSection({
    super.key,
    required this.walletList,
  });
  final List<UserWalletHistory> walletList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentTransactionSectionState();
}

class _RecentTransactionSectionState
    extends ConsumerState<RecentTransactionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: context.textTheme.s18w500.copyWith(
                color: AppColors.black,
              ),
            ),
            InkWell(
              onTap: () => context.pushNamed(TransactionView.routeName),
              child: Row(
                children: [
                  Text(
                    'See all',
                    style: context.textTheme.s12w600.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const HorizontalSpacing(4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor,
                    size: 13,
                  )
                ],
              ),
            )
          ],
        ),
        const VerticalSpacing(16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryF5F7F9,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
                itemCount: widget.walletList.length,
                itemBuilder: (context, index) {
                  final transaction = widget.walletList[index];
                  return Column(
                    children: [
                      TransactionWidget(
                        amount: 'N${transaction.amount}',
                        icon: 'assets/icons/income.svg',
                        title: '${transaction.purpose}',
                        date: '12-12-2022 12:00',
                        status: '${transaction.status}',
                      ),
                      const VerticalSpacing(20)
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}
