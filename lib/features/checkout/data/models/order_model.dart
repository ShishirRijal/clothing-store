import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';

class OrderModel {
  String? id;
  String? userId;
  List<CartItem>? cartItems;
  double? totalAmount;
  DateTime? dateTime;
  String? deliveryAddress;
  bool? isDelivered;

  OrderModel({
    this.id,
    this.userId,
    this.cartItems,
    this.totalAmount,
    this.dateTime,
    this.deliveryAddress,
    this.isDelivered,
  });
}
