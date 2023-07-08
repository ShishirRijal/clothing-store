import 'package:dartz/dartz.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';

import '../../../../core/base_usecase.dart';
import '../repositories/auth_respository.dart';

class LogoutUseCase extends BaseUseCase<NoParams, void> {
  AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
