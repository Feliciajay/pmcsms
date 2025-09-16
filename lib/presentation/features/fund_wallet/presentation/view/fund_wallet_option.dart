import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/view/bank_transfer_view.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/view/card_fund_view.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class FundAccountOptions extends StatefulWidget {
  const FundAccountOptions({super.key});

  @override
  State<FundAccountOptions> createState() => _FundAccountOptionsState();
}

class _FundAccountOptionsState extends State<FundAccountOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fund Wallet',
                style: context.textTheme.s16w500.copyWith(
                  color: AppColors.black,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.cancel,
                  //  color: AppColors.primaryF5F5F5,
                ),
              )
            ],
          ),
          const VerticalSpacing(17),
          const Divider(
            color: AppColors.primaryE8E8E8,
          ),
          const VerticalSpacing(17),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fundAccountOptions.length,
                itemBuilder: (_, index) {
                  final data = fundAccountOptions[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _onTap(index);
                        },
                        child: Container(
                          height: 58.h,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryF5F7F9,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(data['icon']),
                                  const HorizontalSpacing(12),
                                  Text(data['option'])
                                ],
                              ),
                              SvgPicture.asset('assets/icons/arrow_right.svg'),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacing(20)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.pushNamed(BankTransferView.routeName);
      case 1:
        context.pushNamed(CardFundView.routeName);

      default:
    }
  }
}

final List<Map<String, dynamic>> fundAccountOptions = [
  {"icon": "assets/icons/bank.svg", "option": "Bank Transfer"},
  {"icon": "assets/icons/card.svg", "option": "Card Payment"},
];
