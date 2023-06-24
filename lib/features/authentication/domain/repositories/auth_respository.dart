import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(String email, String password);
  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, void>> logout();
  Future<bool> isLoggedIn();
}
