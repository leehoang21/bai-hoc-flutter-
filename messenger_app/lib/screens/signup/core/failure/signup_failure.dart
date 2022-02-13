class SignUpFailure  {

  static String failure(String code) {
    switch (code) {
      case 'invalid-email':
        return 
          'Email is not valid or badly formatted.';
      case 'user-disabled':
        return 
          'This user has been disabled. Please contact support for help.';
      case 'email-already-in-use':
        return 
          'An account already exists for that email.';
      case 'operation-not-allowed':
        return 
          'Operation is not allowed.  Please contact support.';
      case 'weak-password':
        return 
          'Please enter a stronger password.';
      default:
        return 
          'An unknown error occurred.';
    }
  }
}
