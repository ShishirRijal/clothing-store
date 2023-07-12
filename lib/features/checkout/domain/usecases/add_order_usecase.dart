import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';
import 'package:clothing_store/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/order.dart' as order;

class AddOrderUseCase extends BaseUseCase<order.Order, void> {
  final CheckoutRepository checkoutRepository;

  AddOrderUseCase(this.checkoutRepository);

  @override
  Future<Either<Failure, void>> call(order.Order params) {
    return checkoutRepository.addOrder(params);
  }
}
