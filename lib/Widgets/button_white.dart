import 'package:flutter/material.dart';
import 'package:resquecare/colors.dart';

// ignore: must_be_immutable
class ButtonWhite extends StatelessWidget {
  Size? fixedSize;
  final String buttonText;
  final void Function()? onPressed;
  ButtonWhite({
    super.key,
    this.fixedSize,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize ??= const Size(146, 46),
        side: const BorderSide(color: AppColors.purpleButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: AppColors.purpleButton,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
