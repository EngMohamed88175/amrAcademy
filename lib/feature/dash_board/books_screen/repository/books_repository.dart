import 'package:dartz/dartz.dart';
import 'package:schoolacademy/core/utils/firebase/firebase_instanced.dart';
import 'package:schoolacademy/core/utils/error/fire_base_error_handeler.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';

class BooksRepository {
  final FireBaseInstance fireBaseInstance = FireBaseInstance();

  Future<Either<FirebaseErrorHandler, List<BookScoolGradeModel>>> fetchClasses(
      String collectionName) async {
    try {
      final querySnapshot = await fireBaseInstance.firebaseFirestore
          .collection(collectionName)
          .get();

      final List<BookScoolGradeModel> books =
          querySnapshot.docs.map((detailDoc) {
        final data = detailDoc.data();

        return BookScoolGradeModel(
          bookNameGrade:  data['bookNameGrade'] ?? '',

          // Handle fields that might be strings instead of lists

          nameGradeBook: (data['nameGradeBook'] is List)
              ? List<String>.from(data['nameGradeBook'])
              : [data['nameGradeBook'] ?? ''],
          linkBook: (data['linkBook'] is List)
              ? List<String>.from(data['linkBook'])
              : [data['linkBook'] ?? ''],
          id: (data['id'] is List)
              ? List<String>.from(data['id'])
              : [data['id'] ?? ''], 
              chooseBookStudent: (data['chooseBookStudent'] is List)
              ? List<String>.from(data['chooseBookStudent'])
              : [data['chooseBookStudent'] ?? ''],
               linkBookStudentWeapon:  (data['linkBookStudentWeapon'] is List)
              ? List<String>.from(data['linkBookStudentWeapon']) : [data['linkBookStudentWeapon'] ?? ''],
               linkBookAladwaa: 
                (data['linkBookAladwaa'] is List)
              ? List<String>.from(data['linkBookAladwaa']) : [data['linkBookAladwaa'] ?? ''],
        );
      }).toList();

      return Right(books);
    } catch (e) {
      // print("Firestore error: $e");
      // print("Stack trace: $stacktrace");
      String errorMessage =
          FirebaseErrorHandler.handleFirestoreError(e.toString()).message;
      return Left(FirebaseErrorHandler(errorMessage));
    }
  }
}
