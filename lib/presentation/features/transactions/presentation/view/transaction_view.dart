import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transactions/components/add_funds_transactions.dart';
import 'package:pmcsms/presentation/features/transactions/components/all_transactions.dart';
import 'package:pmcsms/presentation/features/transactions/components/transfer_in_transactions.dart';
import 'package:pmcsms/presentation/features/transactions/components/transfer_out_transactions.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});
  static const String routeName = '/transactionView';

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title: 'Transactions',
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15, top: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4)),
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                  labelColor: AppColors.white,
                  labelStyle: context.textTheme.s12w400,
                  tabs: const [
                    Text('All'),
                    Text('Add funds'),
                    Text('Transfer in'),
                    Text('Transfer out'),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllTransactions(),
                AddFundsTransactions(),
                TransferInTransactions(),
                TransferOutTransactions(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
