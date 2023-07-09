import 'package:clothing_store/features/cart/data/models/cart_item.dart';
import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String? id;
  String? userId;
  List<CartItemModel>? cartItems;
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
  // to json
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
  // from json
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
