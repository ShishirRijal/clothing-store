import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/resources.dart';
import 'custom_popup_dialog.dart';

class CustomAlertPopup extends StatelessWidget {
  const CustomAlertPopup({
    required this.assetAddress,
    required this.text,
    this.isJson = true,
    this.showButton = false,
    this.onPressed,
    this.buttonText = 'Okay',
    super.key,
  });
  final String assetAddress;
  final String text;
  final bool isJson;
  final bool showButton;
  final Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return CustomPopupDialog(children: [
      isJson
          ? SizedBox(height: 100, width: 100, child: Lottie.asset(assetAddress))
          : Image.asset(assetAddress, height: 100, width: 100),
      const SizedBox(height: 20),
      Text(
        text,
        textAlign: TextAlign.center,
        style: getMediumTextStyle(color: ColorManager.black),
      ),
      if (showButton) ...[
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText,
                style: Theme.of(context).textTheme.labelMedium)),
      ]
    ]);
  }
}
