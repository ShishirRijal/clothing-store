import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:clothing_store/features/shop/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/data.dart';
import '../../../authentication/data/network/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProductRepositoryImpl({
    required this.networkInfo,
    required this.firestore,
  });

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await firestore.collection('products').add(product.toJson());
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(Failure(
          ResponseCode.UNKNOWN,
          e.message ?? ResponseMessage.UNKNOWN,
        ));
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
  Future<Either<Failure, void>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getProduct(String name) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProduct(String productId) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
