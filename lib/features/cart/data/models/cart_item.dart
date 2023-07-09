import 'package:clothing_store/features/shop/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemModel {
  String? id;
  ProductModel product;
  int? quantity;
  double? totalPrice;
  List<String>? size;
  List<String>? color;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.size,
    required this.color,
  });

  // to json
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  // from json
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
