// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String?,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'size': instance.size,
      'color': instance.color,
    };
