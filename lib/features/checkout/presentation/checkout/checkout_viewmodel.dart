import 'package:clothing_store/features/checkout/domain/usecases/add_order_usecase.dart';
import 'package:clothing_store/features/checkout/domain/usecases/get_all_orders_usecase.dart';
import 'package:clothing_store/features/shop/presentation/main/main_view.dart';
import 'package:clothing_store/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_usecase.dart';
import '../../../../core/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../authentication/data/failure/failure.dart';
import '../../../cart/domain/entities/cart_item.dart';
import '../../domain/entities/order.dart' as order;

class PaymentGateway {
  String name;
  int number;
  IconData icon;
  PaymentGateway(this.name, this.number, this.icon);
}

class Delivery {
  String address;
  String city;
  Delivery(this.address, this.city);
}

class CheckoutViewModel extends ChangeNotifier {
  Delivery deliveryAddress =
      Delivery('123, Oakridge From Lane', 'New York, NY');
  PaymentGateway? selectedPaymentMethod;

  List<PaymentGateway> paymentGateways = [
    PaymentGateway('Apple Pay', 123456789, Icons.apple),
    PaymentGateway('Visa', 987654321, Icons.payment),
    PaymentGateway('PayPal', 123456789, Icons.paypal),
    PaymentGateway('MasterCard', 123456789, Icons.payment),
  ];
  void fetchDeliveryAddress() async {
    // fetch delivery address
  }

  void fetchPaymentMethod() async {
    // fetch payment method
  }

  bool validate(BuildContext context) {
    String? message;
    if (deliveryAddress == null) {
      message = 'Please select a delivery address';
    } else if (selectedPaymentMethod == null) {
      message = 'Please select a payment method';
    }
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: ColorManager.error,
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  Future<Either<Failure, List<order.Order>>> fetchOrders() async {
    final usecase = getIt<GetAllOrdersUseCase>();
    return usecase(const NoParams());
  }

  Future<Either<Failure, void>> addOrder(List<CartItem> cartItems) async {
    final usecase = getIt<AddOrderUseCase>();
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    final orderr = order.Order(
      id: DateTime.now().toString(),
      userId: 'user',
      cartItems: cartItems,
      totalAmount: total,
      dateTime: DateTime.now(),
      deliveryAddress: "${deliveryAddress.address} ${deliveryAddress.city}",
    );
    return usecase(orderr);
  }
}
