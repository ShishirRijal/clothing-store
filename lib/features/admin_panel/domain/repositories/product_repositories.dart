import 'package:dartz/dartz.dart';

import '../../../authentication/data/failure/failure.dart';
import '../../../shop/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> addProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, void>> updateProduct(String id);
  Future<Either<Failure, void>> getProduct(String name);
  Future<Either<Failure, void>> getProducts();
}
