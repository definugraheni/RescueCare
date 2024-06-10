import 'package:flutter/material.dart';
import 'package:resquecare/colors.dart';

// ignore: must_be_immutable
class ButtonPurple extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  Size? fixedSize;
  ButtonPurple({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.fixedSize
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize??= const Size(146, 46),
        side: const BorderSide(color: AppColors.purpleButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.purpleButton,
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
