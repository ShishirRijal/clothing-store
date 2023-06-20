import 'package:clothing_store/data/data.dart';
import 'package:clothing_store/domain/repositories/auth_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../network/network_info.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final FirebaseAuth firebaseAuth;
  AuthRepositoryImpl({required this.networkInfo, required this.firebaseAuth});

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return const Right(null);
      } catch (e) {
        return const Left(
            Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
      }
    } else {
      return const Left(Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      ));
    }
  }

  @override
  Future<void> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
