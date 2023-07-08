import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> addProduct(AddProductParams params);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, void>> updateProduct(String id);
  Future<Either<Failure, void>> getProduct(String name);
  Future<Either<Failure, void>> getProducts();
}
