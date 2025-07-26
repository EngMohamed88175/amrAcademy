class FirebaseErrorHandler {
  final String message;

  FirebaseErrorHandler(this.message);

  static FirebaseErrorHandler handleFirebaseAuthError(String errorCode) {
    String message;
    switch (errorCode) {
      case 'invalid-email':
        message = 'The email address is not valid.';
        break;
      case 'user-not-found':
        message = 'No user found with this email.';
        break;
      case 'wrong-password':
        message = 'The password is incorrect.';
        break;
      case 'user-disabled':
        message = 'The user account has been disabled.';
        break;
      case 'email-already-in-use':
        message = 'The email address is already in use by another account.';
        break;
      case 'operation-not-allowed':
        message = 'Email/password accounts are not enabled.';
        break;
      case 'weak-password':
        message = 'The password is too weak.';
        break;
      case 'network-request-failed':
        message = 'Network error occurred. Please check your connection.';
        break;
      case 'too-many-requests':
        message = 'Too many login attempts. Please try again later.';
        break;
      case 'requires-recent-login':
        message = 'This operation requires recent login. Please re-authenticate and try again.';
        break;
      case 'unknown':
      default:
        message = 'An unknown error occurred. Please try again.';
    }
    return FirebaseErrorHandler(message);
  }

  static FirebaseErrorHandler handleFirestoreError(String errorCode) {
    String message;
    switch (errorCode) {
      case 'not-found':
        message = 'Document not found.';
        break;
      case 'permission-denied':
        message = 'You do not have permission to access this document.';
        break;
      case 'unavailable':
        message = 'Firestore service is currently unavailable. Try again later.';
        break;
      case 'resource-exhausted':
        message = 'Quota exceeded. Try again later.';
        break;
      case 'deadline-exceeded':
        message = 'Request took too long to complete. Please try again.';
        break;
      case 'unknown':
      default:
        message = 'An unknown Firestore error occurred. Please try again.';
    }
    return FirebaseErrorHandler(message);
  }

  static FirebaseErrorHandler handleStorageError(String errorCode) {
    String message;
    switch (errorCode) {
      case 'object-not-found':
        message = 'No object exists at the desired reference.';
        break;
      case 'unauthorized':
        message = 'You do not have permission to access this resource.';
        break;
      case 'cancelled':
        message = 'Upload has been canceled.';
        break;
      case 'unknown':
      default:
        message = 'An unknown storage error occurred. Please try again.';
    }
    return FirebaseErrorHandler(message);
  }
}
