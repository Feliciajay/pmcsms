import 'package:flutter/material.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/components/recent_recipient_list_section.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/components/recipient_section.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class TransferFundsView extends StatelessWidget {
  const TransferFundsView({super.key});
  static const String routeName = '/transferFunds';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Transfer Funds',
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipientSection(),
            VerticalSpacing(24),
            RecentRecipientListSection()
          ],
        ),
      )),
    );
  }
}
