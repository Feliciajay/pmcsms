import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton({
    required this.onTap,
    required this.title,
    super.key,
    this.isEnabled = true,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.primary1C1C1C,
    this.hasBorder = false,
    this.isLoading = false,
    this.width = double.infinity,
    this.borderColor = AppColors.primaryE8E8E8,
    this.icon,
  });

  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool hasBorder;
  final String title;
  final String? icon;
  final void Function() onTap;
  final bool isLoading;
  final double width;

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: InkWell(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? widget.backgroundColor
                  : AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.fromBorderSide(
                widget.hasBorder
                    ? BorderSide(color: widget.borderColor)
                    : BorderSide.none,
              )),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon != null
                    ? SvgPicture.asset(widget.icon.toString())
                    : const SizedBox.shrink(),
                const HorizontalSpacing(5),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
