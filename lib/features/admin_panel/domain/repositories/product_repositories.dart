import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> addProduct();
  Future<Either<Failure, void>> deleteProduct();
  Future<Either<Failure, void>> updateProduct();
  Future<Either<Failure, void>> getProduct();
}
