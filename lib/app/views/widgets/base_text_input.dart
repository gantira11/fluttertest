import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/text_styles.dart';

class BaseTextInput extends StatelessWidget {
  const BaseTextInput({
    Key? key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.hintText,
    required this.labelText,
  }) : super(key: key);

  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyles.TEXT_DEFAULT,
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: TextStyles.TEXT_DEFAULT.copyWith(color: AppColors.GREY),
          ),
          hintText: hintText,
          hintStyle: TextStyles.TEXT_DEFAULT.copyWith(
            color: AppColors.GREY,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.GREY,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.GREY,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: suffixIcon,
          isDense: true,
        ),
        validator: validator,
      ),
    );
  }
}
