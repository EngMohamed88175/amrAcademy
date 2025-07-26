import 'package:dartz/dartz.dart';
import 'package:schoolacademy/core/utils/firebase/firebase_instanced.dart';
import 'package:schoolacademy/core/utils/error/fire_base_error_handeler.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';

class HomeRepository {
  final FireBaseInstance fireBaseInstance = FireBaseInstance();

  Future<Either<FirebaseErrorHandler, List<ClassesGradePrimaryModel>>>
      fetchClasses(String collectionName) async {
    try {
      final querySnapshot = await fireBaseInstance.firebaseFirestore
          .collection(collectionName)
          .get();

      final List<ClassesGradePrimaryModel> classes =
          querySnapshot.docs.map((detailDoc) {
        final data = detailDoc.data();
        return ClassesGradePrimaryModel(
          nameGrade: data['nameGrade'] ?? 'Unknown nameGrade',
          nameTeacher: List<String>.from(data['nameTeacher'] ?? []),
          descriptions: List<String>.from(data['descriptions'] ?? []),
          videoUrl: List<String>.from(data['videoUrl'] ?? []),
          image: List<String>.from(data['image'] ?? ['default_image.png']),
          id: List<String>.from(data['id'] ?? []),
        );
      }).toList();

      const List<String> gradeOrder = [
        'الصف الاول الإبتدائي',
        'الصف الثاني الإبتدائي',
        'الصف الثالث الإبتدائي',
        'الصف الرابع الإبتدائي',
        'الصف الخامس الإبتدائي',
        'الصف السادس الإبتدائي',
        'الصف الاول الاعدادي',
        'الصف الثاني الاعدادي',
        'الصف الثالث الاعدادي',
      ];
      // Sort classes based on the defined order
      classes.sort((a, b) => gradeOrder
          .indexOf(a.nameGrade)
          .compareTo(gradeOrder.indexOf(b.nameGrade)));

      return Right(classes);
    } catch (e) {
      // print("Firestore error: $e");
      // print("Stack trace: $stacktrace");
      String errorMessage =
          FirebaseErrorHandler.handleFirestoreError(e.toString()).message;
      return Left(FirebaseErrorHandler(errorMessage));
    }
  }

  Future<Either<FirebaseErrorHandler, List<BookScoolGradeModel>>>
      fetchNameGridBooks(String collectionName) async {
    try {
      final querySnapshot = await fireBaseInstance.firebaseFirestore
          .collection(collectionName)
          .get();

      final List<BookScoolGradeModel> books =
          querySnapshot.docs.map((detailDoc) {
        final data = detailDoc.data();

        return BookScoolGradeModel(
          bookNameGrade: data['bookNameGrade'] ?? '',
          chooseBookStudent: (data['chooseBookStudent'] is List)
              ? List<String>.from(data['chooseBookStudent'])
              : [data['chooseBookStudent'] ?? ''],
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
          linkBookStudentWeapon: (data['linkBookStudentWeapon'] is List)
              ? List<String>.from(data['linkBookStudentWeapon'])
              : [data['linkBookStudentWeapon'] ?? ''],
          linkBookAladwaa: (data['linkBookAladwaa'] is List)
              ? List<String>.from(data['linkBookAladwaa'])
              : [data['linkBookAladwaa'] ?? ''],
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
