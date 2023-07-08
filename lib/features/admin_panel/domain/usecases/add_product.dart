import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';

import '../../../shop/domain/entities/product.dart';

class AddProduct extends BaseUseCase<Product, void> {
  ProductRepository repository;
  AddProduct({required this.repository});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, void>> call(Product product) {
    return repository.addProduct(product);
  }
}
