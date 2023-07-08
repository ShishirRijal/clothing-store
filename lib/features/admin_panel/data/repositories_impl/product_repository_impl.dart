import 'dart:io';

import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  Future<Either<Failure, void>> addProduct(AddProductParams params) async {
    if (await networkInfo.isConnected) {
      try {
        //get a unique id from firebase
        String productId = firestore.collection('products').doc().id;

        // * upload image to firebase storage
        await FirebaseStorage.instance.ref('products/$productId').putFile(
              File(params.image.path),
              // let gurantee that we reach here when there's a image selected
            );

        // now get the image url
        String imageUrl = await FirebaseStorage.instance
            .ref('products/$productId')
            .getDownloadURL();
        //add new product to firebase with uid as id
        params.product.id = productId;
        params.product.image = imageUrl;
        await firestore
            .collection('products')
            .doc(productId)
            .set(params.product.toJson());

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
