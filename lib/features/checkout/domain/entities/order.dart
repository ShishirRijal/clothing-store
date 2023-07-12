import 'package:json_annotation/json_annotation.dart';

import '../../../cart/domain/entities/cart_item.dart';
part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
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

// to json
  Map<String, dynamic> toJson() => _$OrderToJson(this);
  // from json
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
