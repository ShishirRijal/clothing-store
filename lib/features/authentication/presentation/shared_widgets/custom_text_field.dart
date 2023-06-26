import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    required this.errorText,
    this.icon,
    required this.onChange,
    this.hintText,
    this.isObscure = false,
    this.initialValue,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
  }) : super(key: key);
  final Function(String) onChange;
  final String? label;
  final String? hintText;
  final String? errorText;
  final IconData? icon;
  final bool isObscure;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      textInputAction: textInputAction,
      initialValue: initialValue,
      focusNode: focusNode,
      onChanged: (value) {
        onChange(value);
      },
      style: getRegularTextStyle(),
      obscureText: isObscure,
      decoration: InputDecoration(
        errorText: errorText,
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: label,
        hintText: isObscure ? "Create a strong password" : hintText,
        prefixIcon: Icon(
          icon,
          color: ColorManager.primary,
        ),
        labelStyle: getRegularTextStyle(),
        hintStyle: getRegularTextStyle(color: ColorManager.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.primary, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: ColorManager.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: ColorManager.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: ColorManager.error, width: 2),
        ),
      ),
    );
  }
}
