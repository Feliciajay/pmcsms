import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/transaction_pin/presentation/views/set_transaction_pin.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AccountSetUpSection extends StatefulWidget {
  const AccountSetUpSection({super.key});

  @override
  State<AccountSetUpSection> createState() => _AccountSetUpSectionState();
}

class _AccountSetUpSectionState extends State<AccountSetUpSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Setup',
                  style: context.textTheme.s16w500.copyWith(
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryF5F5F5,
                    ),
                    child: SvgPicture.asset('assets/icons/cancel.svg'),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.primaryE8E8E8,
          ),
          const VerticalSpacing(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 7,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(87),
                        color: AppColors.primaryE6E5E5,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.3,
                        borderRadius: BorderRadius.circular(87),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      '50%',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary494949,
                      ),
                    )
                  ],
                ),
                const VerticalSpacing(15),
                SetupAccountWidget(
                  title: 'Create transaction pin',
                  subTitle: 'Set up a pin for your transactions',
                  onTap: () => context.pushNamed(SetTransactionPin.routeName),
                ),
                const VerticalSpacing(25),
                const SetupAccountWidget(
                  title: 'Start your Kyc',
                  subTitle: 'Let’s verify your identity',
                ),
                const VerticalSpacing(25),
                const SetupAccountWidget(
                  title: 'Fund your wallet',
                  subTitle: 'Top your wallet with a bank transfer or atm',
                ),
                const VerticalSpacing(25),
                const SetupAccountWidget(
                  title: 'User ID',
                  subTitle: 'Create a user ID',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SetupAccountWidget extends StatelessWidget {
  const SetupAccountWidget(
      {super.key, required this.title, required this.subTitle, this.onTap});
  final String title;
  final String subTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/setup_icon.svg'),
              const HorizontalSpacing(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.s14w600.copyWith(
                      color: AppColors.primary1C1C1C,
                    ),
                  ),
                  const VerticalSpacing(1),
                  Text(
                    subTitle,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary676767,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primary676767,
            size: 18,
          )
        ],
      ),
    );
  }
}
