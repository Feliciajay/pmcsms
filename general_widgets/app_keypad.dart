// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class AppKeypad extends StatelessWidget {
  AppKeypad({
    super.key,
    this.shouldShowAuthBtn = false,
    required this.onTap,
  });
  final bool shouldShowAuthBtn;
  final void Function(String?) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Wrap(
        runSpacing: 10.h,
        spacing: 10.w,
        alignment: WrapAlignment.center,
        children: [
          ...buttons.map((button) => _KeyPadBtn(
              label: Text(
                button,
                style: context.textTheme.s14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              onTap: () => onTap.call(button))),
          _KeyPadBtn(
              label: shouldShowAuthBtn
                  ? const Icon(
                      Icons.fingerprint,
                      color: AppColors.black,
                      size: 30,
                    )
                  : Text(
                      '.',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.black,
                      ),
                    ),
              onTap: () {
                if (shouldShowAuthBtn) {
                } else {
                  onTap.call('.');
                }
              }),
          _KeyPadBtn(
              label: Text(
                '0',
                style: context.textTheme.s14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              onTap: () => onTap.call('0')),
          _KeyPadBtn(
              label: const Icon(
                Icons.backspace,
                color: AppColors.black,
                size: 30,
              ),
              onTap: () => onTap.call(null))
        ],
      ),
    );
  }

  final buttons = List.generate(9, (index) => '${index + 1}');
}

class _KeyPadBtn extends StatelessWidget {
  const _KeyPadBtn({
    required this.label,
    required this.onTap,
    this.numPadColor,
  });
  final Widget label;
  final Color? numPadColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: Container(
          height: 50.h,
          width: 0.25.sw,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: numPadColor ?? AppColors.white,
              borderRadius: BorderRadius.circular(100).r),
          child: Center(
            child: label,
          ),
        ));
  }
}
