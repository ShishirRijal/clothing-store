import 'package:clothing_store/features/authentication/data/network/network_info.dart';
import 'package:clothing_store/features/shop/domain/entities/product.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';
import 'package:clothing_store/features/shop/domain/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/network/error_handler.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  final FirebaseFirestore firestore;
  ProductRepositoryImpl({
    required this.networkInfo,
    required this.firestore,
  });

  @override
  Future<Either<Failure, List<Product>>> getProductByName(String name) async {
    if (await networkInfo.isConnected) {
      try {
        // fetch product from firestore and return
        // if there's no product with this name return empty list
        final response = await firestore.collection('products').get();
        final products = response.docs
            .map((product) => Product.fromJson(product.data()))
            .toList();

        return Right(products);
      } catch (e) {
        return Left(Failure(
          ResponseCode.UNKNOWN,
          e.toString(),
        ));
      }
    } else {
      return const Left(Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getTrending() {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
