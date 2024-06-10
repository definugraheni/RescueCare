import 'package:flutter/material.dart';
import 'package:resquecare/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  bool? obsecureText;
  bool? readOnly;
  int? maxLine;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? filled;
  final Color? fillColor;
  CustomTextField({
    super.key,
    required this.hintText,
    this.obsecureText,
    this.prefixIcon,
    this.maxLine,
    this.readOnly,
    this.controller,
    this.validator,
    this.keyboardType, this.onTap, this.filled, this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLine??=1,
      readOnly: readOnly ??= false,
      keyboardType: keyboardType,
      obscureText: obsecureText ??= false,
      controller: controller,
      validator: validator,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.black,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.purpleButton,
            width: 2.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff68747e)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.purpleButton,
            width: 2.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.purpleButton,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
