import 'package:flutter/material.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AddDraftTextWidget extends StatelessWidget {
  const AddDraftTextWidget(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      required this.height});
  final String title;
  final String hintText;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.s14w400.copyWith(
            color: AppColors.primary0C0C0C,
          ),
        ),
        const VerticalSpacing(8),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryE8E8E8)),
          child: TextField(
            controller: controller,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: context.textTheme.s14w400.copyWith(
                color: AppColors.primary979797,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
