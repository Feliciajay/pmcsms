import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/view/fund_wallet_option.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/view/transfer_funds_view.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';

class TransferFundsWalletButtons extends StatelessWidget {
  const TransferFundsWalletButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 160.w,
          child: AppSendButton(
              backgroundColor: AppColors.primaryECE7FE,
              icon: 'assets/icons/transfer_funds.svg',
              textColor: AppColors.primaryColor,
              onTap: () {
                context.pushNamed(TransferFundsView.routeName);
              },
              title: 'Transfer funds'),
        ),
        SizedBox(
          width: 160.w,
          child: AppSendButton(
              icon: 'assets/icons/fund_wallet.svg',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return const FundAccountOptions();
                    });
              },
              title: 'Fund Wallet'),
        ),
      ],
    );
  }
}
