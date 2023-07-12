import 'package:dartz/dartz.dart';

import '../../../../core/base_usecase.dart';
import '../../../authentication/data/failure/failure.dart';
import '../repositories/checkout_repository.dart';
import '../entities/order.dart' as order;

class GetAllOrdersUseCase extends BaseUseCase<void, List<order.Order>> {
  final CheckoutRepository checkoutRepository;

  GetAllOrdersUseCase(this.checkoutRepository);

  @override
  Future<Either<Failure, List<order.Order>>> call(void params) {
    return checkoutRepository.getAllOrders();
  }
}
