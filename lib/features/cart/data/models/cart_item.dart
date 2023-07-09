import 'package:json_annotation/json_annotation.dart';

import '../../../shop/domain/entities/product.dart';
part 'cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemModel {
  String? id;
  Product? product;
  int? quantity;
  double? totalPrice;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });

  // to json
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  // from json
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
