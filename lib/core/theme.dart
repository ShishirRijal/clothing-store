import 'package:flutter/material.dart';

import 'resources/resources.dart';

ThemeData get theme => _theme;

ThemeData _theme = ThemeData(
  scaffoldBackgroundColor: ColorManager.white,
  primaryColor: ColorManager.primary,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(primary: ColorManager.primary, secondary: ColorManager.accent),
  //! text theme

  textTheme: TextTheme(
    //* display
    headlineLarge: getBoldTextStyle(size: 24),
    headlineSmall: getSemiBoldTextStyle(size: 20),
    //* Body
    bodyLarge: getRegularTextStyle(size: 18),

    //* label
    labelLarge: getRegularTextStyle(color: ColorManager.accent),
    // used for buttons
    labelMedium: getSemiBoldTextStyle(color: ColorManager.white, size: 18),
  ),
);
