import '../../../cart/domain/entities/cart_item.dart';

class Order {
  String id;
  String userId;
  List<CartItem> cartItems;
  double totalAmount;
  DateTime dateTime;
  String deliveryAddress;
  bool isDelivered;

  Order({
    required this.id,
    required this.userId,
    required this.cartItems,
    required this.totalAmount,
    required this.dateTime,
    required this.deliveryAddress,
    this.isDelivered = false,
  });
}
