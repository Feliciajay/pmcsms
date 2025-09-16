import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/app_keypad.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class CustomPinInputField extends StatefulWidget {
  const CustomPinInputField(
      {super.key, required this.onCompleted, required this.pinController});
  final Function() onCompleted;
  final TextEditingController pinController;

  @override
  State<CustomPinInputField> createState() => _CustomPinInputFieldState();
}

class _CustomPinInputFieldState extends State<CustomPinInputField> {
  String pin = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: const BoxDecoration(color: AppColors.white),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.cancel,
                      color: AppColors.primary333333,
                    ),
                  ),
                ),
                const VerticalSpacing(5),
                Text(
                  'Enter Transaction Pin',
                  style: context.textTheme.s14w700.copyWith(
                    color: AppColors.primary333333,
                  ),
                ),
                const VerticalSpacing(18),
                Pinput(
                  controller: widget.pinController,
                  length: 6,
                  closeKeyboardWhenCompleted: true,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(color: AppColors.black),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.primary333333),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pin = value; // Update pin when changed
                      if (pin.length == 6) {
                        // Trigger the API call once the pin is complete
                        widget.onCompleted();
                        Navigator.of(context).pop(); // Close the bottom sheet
                      }
                    });
                  },
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: AppColors.primaryD2D5DB),
              child: AppKeypad(
                onTap: (keyPressed) {
                  if (keyPressed != null) {
                    if (keyPressed == '.') {
                      return;
                    }
                    widget.pinController.append(keyPressed, 6);
                  } else {
                    widget.pinController.delete();
                  }
                },
              )),
        ],
      ),
    );
  }
}

class NumPadButtonWidget extends StatelessWidget {
  const NumPadButtonWidget(
      {super.key,
      required this.text,
      this.numpadColor,
      this.isText = true,
      required this.onPressed});
  final String text;
  final Color? numpadColor;
  final bool? isText;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(text),
      child: Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
          decoration: BoxDecoration(
            color: numpadColor ?? AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff848688),
              ),
            ],
          ),
          child: isText == true
              ? Text(
                  text,
                  style: context.textTheme.s14w400.copyWith(
                    color: AppColors.black,
                  ),
                )
              : const Icon(Icons.keyboard_backspace)

          // SvgPicture.asset(
          //     'asset/icons/clear.svg',
          //    // width: 10,
          //   ),
          ),
    );
  }
}
