import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.contentPadding,
  });
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        label: labelText != null ? Text(labelText ?? '') : null,
        hintText: hintText,
        border: border,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black12, width: 1.0),
            ),
        errorBorder: errorBorder,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: TColors.grey, width: 1.0),
            ),
        disabledBorder: disabledBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
    );
  }
}
