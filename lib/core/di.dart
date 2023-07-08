import 'package:clothing_store/features/admin_panel/data/repositories_impl/product_repository_impl.dart';
import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:clothing_store/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:clothing_store/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:clothing_store/features/shop/domain/entities/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/authentication/data/data.dart';
import '../features/authentication/data/network/network_info.dart';
import '../features/authentication/domain/domain.dart';
import '../features/authentication/domain/usecases/usecases.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // network info
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(InternetConnectionChecker()));
  // firebase auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // firestore
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // auth repo
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(networkInfo: getIt(), firebaseAuth: getIt()));
  // product repository
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(networkInfo: getIt(), firestore: getIt()));
  // Login usecase
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: getIt()));
  // Register usecase
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepository: getIt()));
  // Logout  usecase
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(authRepository: getIt()));
  // Forgot password usecase
  getIt.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(authRepository: getIt()));
}
