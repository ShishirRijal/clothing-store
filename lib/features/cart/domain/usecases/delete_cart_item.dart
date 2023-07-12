import 'package:clothing_store/core/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';
import '../entities/cart_item.dart';
import '../repositories/cart_repository.dart';

class DeleteCartItemUseCase extends BaseUseCase<CartItem, void> {
  final CartRepository repository;

  DeleteCartItemUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CartItem cartItem) {
    return repository.removeCartItem(cartItem);
  }
}
