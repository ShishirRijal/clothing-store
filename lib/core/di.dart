import 'package:clothing_store/features/admin_panel/data/repositories_impl/product_repository_impl.dart';
import 'package:clothing_store/features/admin_panel/domain/domain.dart';
import 'package:clothing_store/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:clothing_store/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/authentication/data/data.dart';
import '../features/authentication/data/network/network_info.dart';
import '../features/authentication/domain/domain.dart';
import '../features/authentication/domain/usecases/usecases.dart';
import '../features/shop/data/repositories_impl/product_repository_impl.dart'
    as shop;
import '../features/shop/domain/repositories/product_repository.dart' as shop;
import '../features/shop/domain/usecases/get_all_products.dart';

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

  //*  Admin Panel
  // product repository
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(networkInfo: getIt(), firestore: getIt()));

  // add product usecase
  getIt.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(repository: getIt()));

  //* Shop
  // product repository
  getIt.registerLazySingleton<shop.ProductRepository>(() =>
      shop.ProductRepositoryImpl(networkInfo: getIt(), firestore: getIt()));
  // get all products usecase
  getIt.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(repository: getIt()));
}
