import 'package:clothing_store/features/cart/data/models/cart_item.dart';

import '../../../shop/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../../shop/data/mappers/product_mapper.dart';

extension CartItemMapper on CartItemModel? {
  // to entity
  CartItem toEntity() {
    return CartItem(
      id: this?.id ?? '',
      product: this?.product.toEntity() ?? Product.empty(),
      quantity: this?.quantity ?? 0,
      totalPrice: this?.totalPrice ?? 0.0,
    );
  }
}
