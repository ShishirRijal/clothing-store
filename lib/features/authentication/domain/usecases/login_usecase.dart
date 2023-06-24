import 'package:clothing_store/core/base_usecase.dart';
import 'package:clothing_store/features/authentication/domain/repositories/respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:clothing_store/features/authentication/data/failure/failure.dart';

class LoginUseCase extends BaseUseCase<LoginParams, void> {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await authRepository.login(params.email, params.password);
  }
}

class LoginParams {
  String email;
  String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}
