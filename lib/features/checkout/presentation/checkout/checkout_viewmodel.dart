import 'package:clothing_store/utils/utils.dart';
import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier {
  String? _deliveryAddress;
  String? _paymentMethod;
  String? _cardNumber;

  String? get deliveryAddress => _deliveryAddress;
  String? get paymentMethod => _paymentMethod;
  String? get cardNumber => _cardNumber;

  void fetchDeliveryAddress() async {
    // fetch delivery address
  }

  void fetchPaymentMethod() async {
    // fetch payment method
  }

  void selectPaymentMethod() {
    // select payment method
  }

  void validate(BuildContext context) {
    String? message;
    if (_deliveryAddress == null) {
      message = 'Please select a delivery address';
    } else if (_paymentMethod == null || _cardNumber == null) {
      message = 'Please select a payment method';
    }
    if (message != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(getErrorSnackbar(message, context));
    } else {
      getSuccessFlushbar('Order successfully placed!', context);
    }
  }
}
