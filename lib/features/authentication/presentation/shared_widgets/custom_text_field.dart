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
    this.controller,
    this.filled = false,
    this.fillColor,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.style,
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
  final TextEditingController? controller;
  final bool filled;
  final bool enabled;
  final Color? fillColor;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: textInputAction,
      initialValue: initialValue,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: (value) {
        onChange(value);
      },
      enabled: enabled,
      style: style ?? getRegularTextStyle(),
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        errorText: errorText,
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: label,
        hintText: isObscure ? "Create a strong password" : hintText,
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: ColorManager.primary,
              )
            : null,
        labelStyle: getRegularTextStyle(),
        hintStyle: getRegularTextStyle(color: ColorManager.grey),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.primary, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
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
