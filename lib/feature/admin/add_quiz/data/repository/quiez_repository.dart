import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolacademy/core/utils/firebase/database.dart';

class QuizRepository {
  final DatabaseMethods databaseMethods;

  QuizRepository({required this.databaseMethods});

  // إضافة امتحان جديد
  Future<void> addQuiz(Map<String, dynamic> userQuiz, String grade) {
    return databaseMethods.addQuiz(userQuiz, grade);
  }
  // إلغاء امتحان (حذف جميع الأسئلة)
  Future<void> cancelQuiz(String grade) {
    return databaseMethods.cancelQuiz(grade);
  }

  // الحصول على أسئلة من فئة معينة
  Future<Stream<QuerySnapshot>> getCategoryQuiz(String category) {
    return databaseMethods.getCategoryQuiz(category);
  }
}
