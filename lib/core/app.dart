import 'package:clothing_store/core/theme.dart';
import 'package:clothing_store/features/authentication/data/services/auth_services.dart';
import 'package:clothing_store/features/shop/presentation/main/main_view.dart';
import 'package:clothing_store/features/shop/presentation/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/shop/presentation/main/home/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal(); // private constructor

  // singleton instance
  static MyApp instance = const MyApp._internal();

  // This ensures MyApp is a singleton and and when accessed anywhere returns the same instance
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(create: (_) => AuthServices()),
      ],
      child: MaterialApp(
        theme: theme,
        home: const Scaffold(
            body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: HomeView(),
          ),
        )),
        // home: Builder(builder: (context) {
        //   return StreamProvider(
        //     create: (_) => context.read<AuthServices>().authStateChanges,
        //     initialData: null,
        //     child: const AuthenticationWrapper(),
        //   );
        // }),
      ),
    );
  }
}
