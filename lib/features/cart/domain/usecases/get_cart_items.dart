import 'package:clothing_store/core/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';
import '../entities/cart_item.dart';
import '../repositories/cart_repository.dart';

class GetCartItemsUseCase extends BaseUseCase<NoParams, List<CartItem>> {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) {
    return repository.getCartItems();
  }
}
