// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      deliveryAddress: json['deliveryAddress'] as String,
      isDelivered: json['isDelivered'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'totalAmount': instance.totalAmount,
      'dateTime': instance.dateTime.toIso8601String(),
      'deliveryAddress': instance.deliveryAddress,
      'isDelivered': instance.isDelivered,
    };
