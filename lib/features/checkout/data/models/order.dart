import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';

class Order {
  String? id;
  String? userId;
  List<CartItem>? cartItems;
  double? totalAmount;
  DateTime? dateTime;
  String? deliveryAddress;

  Order({
    this.id,
    this.userId,
    this.cartItems,
    this.totalAmount,
    this.dateTime,
    this.deliveryAddress,
  });
}
