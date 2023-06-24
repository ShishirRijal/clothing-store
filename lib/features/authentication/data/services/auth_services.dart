import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();
}
