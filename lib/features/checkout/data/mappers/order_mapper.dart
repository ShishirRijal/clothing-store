import 'package:clothing_store/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:clothing_store/features/checkout/data/models/order_model.dart';

import '../../domain/entities/order.dart';

extension OrderMapper on OrderModel? {
  Order toEntity() {
    return Order(
      id: this?.id ?? '',
      userId: this?.userId ?? '',
      cartItems: this?.cartItems?.map((e) => e.toEntity()).toList() ?? [],
      totalAmount: this?.totalAmount ?? 0,
      dateTime: this?.dateTime ?? DateTime.now(),
      deliveryAddress: this?.deliveryAddress ?? '',
      isDelivered: this?.isDelivered ?? false,
    );
  }
}
