import 'package:flutter/material.dart';

import 'resources.dart';

class FontFamilyManager {
  static const String montserrat = 'Montserrat';
  static const String kollektif = 'Kollektif';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
}

TextStyle _getTextStyle(
    String fontFamily, double size, Color color, FontWeight fontWeight) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontSize: size,
    fontWeight: fontWeight,
  );
}

// Light Text
TextStyle getLightTextStyle({
  String fontFamily = FontFamilyManager.montserrat,
  double size = FontSize.s14,
  Color color = ColorManager.black,
  FontWeight fontWeight = FontWeightManager.light,
}) {
  return _getTextStyle(fontFamily, size, color, fontWeight);
}

// Regular Text Style
TextStyle getRegularTextStyle({
  String fontFamily = FontFamilyManager.kollektif,
  double size = FontSize.s16,
  Color color = ColorManager.black,
  FontWeight fontWeight = FontWeightManager.normal,
}) {
  return _getTextStyle(fontFamily, size, color, fontWeight);
}

// Medium Text
TextStyle getMediumTextStyle({
  String fontFamily = FontFamilyManager.montserrat,
  double size = FontSize.s18,
  Color color = ColorManager.black,
  FontWeight fontWeight = FontWeightManager.medium,
}) {
  return _getTextStyle(fontFamily, size, color, fontWeight);
}

// SemiBold Text
TextStyle getSemiBoldTextStyle({
  String fontFamily = FontFamilyManager.montserrat,
  double size = FontSize.s20,
  Color color = ColorManager.black,
  FontWeight fontWeight = FontWeightManager.semiBold,
}) {
  return _getTextStyle(fontFamily, size, color, fontWeight);
}

// Bold Text
TextStyle getBoldTextStyle({
  String fontFamily = FontFamilyManager.montserrat,
  double size = FontSize.s24,
  Color color = ColorManager.black,
  FontWeight fontWeight = FontWeightManager.bold,
}) {
  return _getTextStyle(fontFamily, size, color, fontWeight);
}
