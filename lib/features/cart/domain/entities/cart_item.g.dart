// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'sizes': instance.sizes,
    };
