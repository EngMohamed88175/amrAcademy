import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addQuiz(Map<String, dynamic> userQuiz, String quiz) async {
    return await FirebaseFirestore.instance.collection(quiz).add(userQuiz);
  }

  Future<Stream<QuerySnapshot>> getCategoryQuiz(String category) async {
    return FirebaseFirestore.instance.collection(category).snapshots();
  }

  Future<void> deleteQuiz(String grade, String quizId) async {
    try {
      await FirebaseFirestore.instance.collection(grade).doc(quizId).delete();
    } catch (e) {
      throw Exception("خطأ في حذف الامتحان: $e");
    }
  }

  Future<void> cancelQuiz(String grade) async {
    try {
      final collection = FirebaseFirestore.instance.collection(grade);
      final snapshot = await collection.get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception("خطأ في إلغاء الامتحان: $e");
    }
  }
}
