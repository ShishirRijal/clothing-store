import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItem>>> getCartItems();
  Future<Either<Failure, void>> addCartItem(CartItem cartItem);
  Future<Either<Failure, void>> removeCartItem(CartItem cartItem);
}
