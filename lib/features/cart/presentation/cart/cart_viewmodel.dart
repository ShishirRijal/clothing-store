import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';
import 'package:clothing_store/features/cart/domain/usecases/get_cart_items.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base_usecase.dart';
import '../../../../core/di.dart';
import '../../domain/usecases/delete_cart_item.dart';
import '../providers/cart.dart';

class CartViewModel extends ChangeNotifier {
  //
  Future<Either<Failure, List<CartItem>>> fetchCartItems(
      BuildContext context) async {
    final usecase = getIt<GetCartItemsUseCase>();
    return usecase(const NoParams());
  }

  Future<Either<Failure, void>> delete(CartItem cartItem) async {
    final usecase = getIt<DeleteCartItemUseCase>();
    return usecase(cartItem);
  }

  checkout(BuildContext context) async {
    // call checkout usecase

    // clear cart
    context.read<Cart>().clearCart();
  }
}
