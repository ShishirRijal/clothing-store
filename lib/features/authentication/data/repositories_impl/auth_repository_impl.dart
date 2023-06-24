import 'package:clothing_store/features/authentication/data/data.dart';
import 'package:clothing_store/features/authentication/data/network/firebase_error_handler.dart';
import 'package:clothing_store/features/authentication/domain/repositories/auth_respository.dart';
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
      } on FirebaseAuthException catch (e) {
        return Left(Failure(
          404,
          FirebaseLogInFailure.fromCode(e.code).message,
        ));
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
  Future<Either<Failure, void>> register(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(
          404,
          FirebaseSignUpFailure.fromCode(e.code).message,
        ));
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
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseAuth.signOut();
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(
          404,
          FirebaseSignUpFailure.fromCode(e.code).message,
        ));
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
  Future<Either<Failure, void>> forgetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(
          404,
          FirebaseLogInFailure.fromCode(e.code).message,
        ));
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
}
