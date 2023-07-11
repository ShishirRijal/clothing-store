import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<List<Product>, Failure>> getProducts();
  Future<Either<List<Product>, Failure>> getTrending();
  Future<Either<List<Product>, Failure>> getProductByName(String name);
}
