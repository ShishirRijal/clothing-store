import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';
import '../repositories/cart_repository.dart';

class AddCartItemUseCase extends BaseUseCase<CartItem, void> {
  final CartRepository repository;

  AddCartItemUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CartItem cartItem) {
    return repository.addCartItem(cartItem);
  }
}
