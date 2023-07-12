import 'package:json_annotation/json_annotation.dart';

import '../../../shop/domain/entities/product.dart';

part 'cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItem {
  String id;
  Product product;
  int quantity;
  double totalPrice;
  List<String> sizes;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.sizes,
  });

  // to json
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
  // from json
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
