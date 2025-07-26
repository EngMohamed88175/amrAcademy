import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolacademy/core/utils/firebase/firebase_instanced.dart';
import 'package:schoolacademy/core/utils/error/fire_base_error_handeler.dart';
import 'package:schoolacademy/feature/admin/login/data/model/login_model.dart';

Logger logger = Logger();

class LoginRepository {
  final FireBaseInstance fireBaseInstance = FireBaseInstance();

  Future<Either<FirebaseErrorHandler, User>> loginUser(
      {required LoginModel loginModel}) async {
    try {
      final result = await fireBaseInstance.auth.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);

      return Right(result.user!);
    } on FirebaseException catch (e) {
      logger.e("FirebaseException: ${e.message}");
      if (e.code.startsWith('storage/')) {
        return Left(FirebaseErrorHandler.handleStorageError(e.code));
      } else {
        return Left(FirebaseErrorHandler.handleFirebaseAuthError(e.code));
      }
    }
  }
}
