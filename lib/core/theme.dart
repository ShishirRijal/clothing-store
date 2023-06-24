import 'package:flutter/material.dart';

import 'resources/resources.dart';

ThemeData get theme => _theme;

ThemeData _theme = ThemeData(
  //! text theme
  textTheme: TextTheme(
    //* display
    headlineLarge: getBoldTextStyle(size: 24),

    //* Body
    bodyLarge: getRegularTextStyle(),

    //* label
    labelLarge: getRegularTextStyle(color: ColorManager.accent),
    // used for buttons
    labelMedium: getSemiBoldTextStyle(color: ColorManager.white, size: 18),
  ),
);
