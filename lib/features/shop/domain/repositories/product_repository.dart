import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<Product>>> getTrending();
  Future<Either<Failure, List<Product>>> getProductByName(String name);
}
