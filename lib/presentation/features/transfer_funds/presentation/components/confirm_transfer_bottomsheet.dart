import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ConfirmTransferBottomsheet extends StatelessWidget {
  const ConfirmTransferBottomsheet(
      {super.key,
      required this.amount,
      required this.onTap,
      required this.recipent});
  final String amount;
  final String recipent;
  final Function() onTap;

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
                'Confirmation',
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
          Container(
            //  height: 58.h,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryF5F7F9,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recipent',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary1C1C1C,
                      ),
                    ),
                    Text(
                      recipent,
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary1C1C1C,
                      ),
                    )
                  ],
                ),
                const VerticalSpacing(21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary1C1C1C,
                      ),
                    ),
                    Text(
                      '₦$amount',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary1C1C1C,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const VerticalSpacing(16),
          AppSendButton(
            onTap: onTap,
            title: 'Proceed',
          )
        ],
      ),
    );
  }
}
