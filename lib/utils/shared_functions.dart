import 'package:flutter/material.dart';

import '../core/resources/resources.dart';

SnackBar getErrorSnackbar(String message, BuildContext context) {
  return SnackBar(
      backgroundColor: ColorManager.error,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.white,
            ),
      ));
}
