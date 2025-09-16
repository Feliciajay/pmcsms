import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_request.dart';
import 'package:pmcsms/presentation/features/transactions/presentation/notifier/get_wallet_history_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';
import 'package:pmcsms/presentation/general_widgets/transaction_widget.dart';

class AllTransactions extends ConsumerStatefulWidget {
  const AllTransactions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllTransactionsState();
}

class _AllTransactionsState extends ConsumerState<AllTransactions> {
  final data = WalletHistoryRequest(
    process: 'pm_wallet',
    action: 'wallet_history',
  );
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getWalletHistoryNotifier.notifier)
          .getWalletHistory(data: data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final walletList = ref.watch(
        getWalletHistoryNotifier.select((v) => v.data?.data?.history ?? []));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryF5F7F9,
      ),
      child: ListView.builder(
          itemCount: walletList.length,
          itemBuilder: (context, index) {
            final transaction = walletList[index];
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
    );
  }
}
