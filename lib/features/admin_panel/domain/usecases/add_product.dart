import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shop/domain/entities/product.dart';

class AddProductUseCase extends BaseUseCase<AddProductParams, void> {
  ProductRepository repository;
  AddProductUseCase({required this.repository});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, void>> call(AddProductParams params) async {
    return repository.addProduct(params);
  }
}

class AddProductParams {
  final Product product;
  final XFile image;
  AddProductParams({required this.product, required this.image});
}
