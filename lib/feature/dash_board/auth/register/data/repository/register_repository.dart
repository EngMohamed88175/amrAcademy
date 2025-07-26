import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolacademy/core/utils/firebase/firebase_instanced.dart';
import 'package:schoolacademy/core/utils/error/fire_base_error_handeler.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/data/model/user_model.dart';

Logger logger = Logger();

class RegisterRepository {
  final FireBaseInstance fireBaseInstance = FireBaseInstance();

  Future<Either<FirebaseErrorHandler, User>> registeruser({
    required UserModel userModel,
  }) async {
    try {
      final UserCredential userCredential = await fireBaseInstance.auth
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password);

      User user = userCredential.user!;
      await user.updateDisplayName(userModel.username);
      await fireBaseInstance.firebaseFirestore
          .collection('user')
          .doc(user.uid)
          .set({...userModel.toJson()});

      Logger().i(userModel.toJson());
      Logger().i(userCredential);
      return Right(user);
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
