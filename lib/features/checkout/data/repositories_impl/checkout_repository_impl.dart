import 'package:clothing_store/features/authentication/data/network/network_info.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';
import 'package:clothing_store/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/network/error_handler.dart';
import '../../domain/entities/order.dart' as order;

class CheckoutRepositoryImpl extends CheckoutRepository {
  final NetworkInfo networkInfo;
  final FirebaseFirestore firestore;
  CheckoutRepositoryImpl({
    required this.networkInfo,
    required this.firestore,
  });
  @override
  Future<Either<Failure, void>> addOrder(order.Order order) async {
    if (await networkInfo.isConnected) {
      try {
        // add order to firestore
        await firestore.collection('orders').add(order.toJson());
        return const Right(null);
      } catch (e) {
        return const Left(Failure(
          ResponseCode.UNKNOWN,
          ResponseMessage.UNKNOWN,
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
  Future<Either<Failure, List<order.Order>>> getAllOrders() async {
    if (await networkInfo.isConnected) {
      try {
        // get all orders from firestore
        final snapshot = await firestore.collection('orders').get();
        final orders = snapshot.docs
            .map((doc) => order.Order.fromJson(doc.data()))
            .toList();
        return Right(orders);
      } catch (e) {
        return const Left(Failure(
          ResponseCode.UNKNOWN,
          ResponseMessage.UNKNOWN,
        ));
      }
    } else {
      return const Left(Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      ));
    }
  }
}
