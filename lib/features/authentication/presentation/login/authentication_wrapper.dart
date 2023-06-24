import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_view.dart';
import 'login_view.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<User?>();
    return user != null ? const HomeView() : const LoginView();
  }
}
