//! Firebase login error code handling
class FirebaseLogInFailure implements Exception {
  final String message;
  const FirebaseLogInFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseLogInFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseLogInFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseLogInFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const FirebaseLogInFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const FirebaseLogInFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const FirebaseLogInFailure();
    }
  }
}

//! Firebase register error code handling
class FirebaseSignUpFailure implements Exception {
  final String message;
  const FirebaseSignUpFailure([
    this.message = 'An unknown exception occurred.',
  ]);
  factory FirebaseSignUpFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseSignUpFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseSignUpFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const FirebaseSignUpFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const FirebaseSignUpFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const FirebaseSignUpFailure(
          'Please enter a stronger password.',
        );
      default:
        return const FirebaseSignUpFailure();
    }
  }
}
