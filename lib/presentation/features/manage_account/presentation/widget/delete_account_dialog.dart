import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 19),
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/icons/cancel.svg')),
          ),
          const VerticalSpacing(15),
          const Text(
            'Confirmation',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(12),
          Text(
            'Are you sure you want to delete this account? Note that this action is irreversible and all your info will be wiped from our record',
            style: context.textTheme.s14w400.copyWith(
              color: AppColors.primary494949,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.31,
                child: AppSendButton(
                    onTap: () => Navigator.pop(context),
                    backgroundColor: AppColors.primaryF6F7F9,
                    title: 'Cancel',
                    textColor: AppColors.primary191919),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.36,
                child: AppSendButton(
                    onTap: onTap,
                    backgroundColor: AppColors.primaryColor,
                    title: 'Delete account',
                    textColor: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
