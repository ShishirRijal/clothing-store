import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/shop/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';

import '../entities/product.dart';

class GetAllProductsUseCase extends BaseUseCase<NoParams, List<Product>> {
  final ProductRepository repository;
  GetAllProductsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return repository.getProducts();
  }
}
