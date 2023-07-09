import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../core/resources/resources.dart';

SnackBar getErrorSnackbar(String message, BuildContext context) {
  return getSnackbar(message, ColorManager.error, context);
}

SnackBar getSuccessSnackbar(String message, BuildContext context) {
  return getSnackbar(message, ColorManager.success, context);
}

Flushbar getSuccessFlushbar(String message, BuildContext context) {
  return Flushbar(
    duration: const Duration(seconds: 2),
    animationDuration: const Duration(milliseconds: 500),
    flushbarPosition: FlushbarPosition.BOTTOM,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    message: message,
    messageSize: 18,
    backgroundColor: ColorManager.success,
    messageColor: ColorManager.white,
    icon: Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: ColorManager.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: ColorManager.success,
      ),
    ),
  )..show(context);
}

SnackBar getSnackbar(String message, Color color, BuildContext context) {
  return SnackBar(
      backgroundColor: color,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.white,
            ),
      ));
}
