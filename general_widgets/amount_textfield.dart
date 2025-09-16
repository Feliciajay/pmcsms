import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    super.key,
    required TextEditingController amountController,
    required this.hintText,
    this.containerColor,
    this.maxLength,
  }) : _amountController = amountController;

  final TextEditingController _amountController;
  final String hintText;
  final Color? containerColor;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
          border: Border.all(color: AppColors.primaryE8E8E8)),
      child: TextField(
        maxLength: maxLength,
        controller: _amountController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          counterText: '',
          hintStyle: context.textTheme.s14w400.copyWith(
            color: AppColors.primary979797,
          ),
        ),
      ),
    );
  }
}
