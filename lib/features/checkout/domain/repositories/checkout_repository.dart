import 'package:clothing_store/features/authentication/data/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/order.dart' as order;

abstract class CheckoutRepository {
  Future<Either<Failure, void>> addOrder(order.Order order);
  Future<Either<Failure, List<order.Order>>> getAllOrders();
}
