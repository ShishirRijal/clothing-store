import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onPressed,
    this.title,
    this.height = 55,
    this.bgColor = ColorManager.primary,
    this.width,
    this.fontSize = 24,
    this.borderRadius = 15,
    this.fontWeight,
    this.fontFamily = FontFamilyManager.kollektif,
    this.child,
    this.alignment,
    this.hPadding,
    this.showInnerBorder = false,
    this.fontColor = ColorManager.white,
    this.leadingTextPadding = 0,
    this.getActualScaleFactor = true,
    super.key,
  });

  final VoidCallback? onPressed;
  final String? title;
  final Color bgColor;

  final double height;
  final double? width;
  final double fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;
  final String fontFamily;
  final Widget? child;
  final double? hPadding;
  final Alignment? alignment;
  final bool showInnerBorder;
  final Color fontColor;
  final double leadingTextPadding;
  final bool getActualScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: ColorManager.grey,
          padding: hPadding != null
              ? EdgeInsets.symmetric(horizontal: hPadding!)
              : EdgeInsets.only(left: leadingTextPadding),
          alignment: alignment,
          shadowColor: const Color(0X5E1253DA),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(title ?? '',
                style:
                    getSemiBoldTextStyle(color: ColorManager.white, size: 18)),
      ),
    );
  }
}
