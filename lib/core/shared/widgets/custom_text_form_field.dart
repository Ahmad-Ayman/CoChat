import 'package:cochat/core/shared/components/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.validator,
    this.onChange,
    required this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    required this.labelText,
    this.labelColor = const Color(0xFF3A8891),
    this.borderColor = const Color(0xFF3A8891),
    this.borderRadius = 25,
    this.textStyle,
  }) : super(key: key);
  final Function? validator;
  final Function? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool isPassword;
  final String labelText;
  final Color labelColor;
  final Color borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator!(value),
      onChanged: (value) => onChange!(value),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isPassword,
      style: textStyle,
      cursorColor: AppColors.mainColor1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
