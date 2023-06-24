import 'package:clothing_store/core/di.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/logout_usecase.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutUseCase = getIt<LogoutUseCase>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("HOME"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  logoutUseCase.call(null);
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
