import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:clothing_store/features/authentication/data/network/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';

import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkInfo networkInfo;
  final FirebaseFirestore firestore;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.firestore,
  });
  @override
  Future<Either<Failure, void>> addCartItem(CartItem cartItem) async {
    if (await networkInfo.isConnected) {
      try {
        await firestore
            .collection('cart')
            .doc(cartItem.id)
            .set(cartItem.toJson());
        return const Right(null);
      } catch (e) {
        return const Left(
            Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
      }
    } else {
      return const Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION));
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    if (await networkInfo.isConnected) {
      try {
        final snapshot = await firestore.collection('cart').get();
        final cartItems =
            snapshot.docs.map((doc) => CartItem.fromJson(doc.data())).toList();
        return Right(cartItems);
      } catch (e) {
        return const Left(
            Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
      }
    } else {
      return const Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION));
    }
  }

  @override
  Future<Either<Failure, void>> removeCartItem(CartItem cartItem) async {
    if (await networkInfo.isConnected) {
      try {
        await firestore.collection('cart').doc(cartItem.id).delete();
        return const Right(null);
      } catch (e) {
        return const Left(
            Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
      }
    } else {
      return const Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION));
    }
  }
}
