// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      deliveryAddress: json['deliveryAddress'] as String?,
      isDelivered: json['isDelivered'] as bool?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'cartItems': instance.cartItems?.map((e) => e.toJson()).toList(),
      'totalAmount': instance.totalAmount,
      'dateTime': instance.dateTime?.toIso8601String(),
      'deliveryAddress': instance.deliveryAddress,
      'isDelivered': instance.isDelivered,
    };
