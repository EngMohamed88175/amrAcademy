import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/utils/firebase/database.dart';
import 'package:schoolacademy/core/utils/function/dialoge_error.dart';
import 'package:schoolacademy/feature/admin/add_quiz/data/repository/quiez_repository.dart';

part 'add_quiz_state.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit() : super(AddQuizInitial());

  final QuizRepository quizRepository =
      QuizRepository(databaseMethods: DatabaseMethods());

  String? selectedGrade;

  final TextEditingController option0Cont = TextEditingController();
  final TextEditingController option1Cont = TextEditingController();
  final TextEditingController option2Cont = TextEditingController();
  final TextEditingController option3Cont = TextEditingController();
  final TextEditingController option4Cont = TextEditingController();
  final TextEditingController correcrtAnswer = TextEditingController();
  final TextEditingController scoreCont = TextEditingController();

  final List<String> grades = [
    'امتحان الصف الأول الابتدائي',
    'امتحان الصف الثاني الابتدائي',
    'امتحان الصف الثالث الابتدائي',
    'امتحان الصف الرابع الابتدائي',
    'امتحان الصف الخامس الابتدائي',
    'امتحان الصف السادس الابتدائي',
    'امتحان الصف الأول الإعدادي',
    'امتحان الصف الثاني الإعدادي',
    'امتحان الصف الثالث الإعدادي',
  ];

  void changeGrades(String newGrade) {
    selectedGrade = newGrade;
    emit(AddQuizGradeChanged(newGrade));
  }

  Future<void> cancelQuiz(BuildContext context) async {
    if (selectedGrade != null) {
      try {
        await quizRepository.cancelQuiz(selectedGrade!);
        showMessage(context, "تم إلغاء الامتحان بنجاح", isError: false);
      } catch (e) {
        showMessage(context, "حدث خطأ أثناء إلغاء الامتحان. حاول مرة أخرى",
            isError: true);
      }
    }
  }
  Future<void> uploadItem(BuildContext context) async {
    if (option0Cont.text.isNotEmpty &&
        option1Cont.text.isNotEmpty &&
        option2Cont.text.isNotEmpty &&
        option3Cont.text.isNotEmpty &&
        option4Cont.text.isNotEmpty &&
        scoreCont.text.isNotEmpty &&
        selectedGrade != null) {
      // String addId = randomAlpha(10);

      try {
        Map<String, dynamic> addQuiz = {
          "option0": option0Cont.text,
          "option1": option1Cont.text,
          "option2": option2Cont.text,
          "option3": option3Cont.text,
          "option4": option4Cont.text,
          "correct": correcrtAnswer.text,
          "score": int.parse(scoreCont.text),
        };

        await quizRepository.addQuiz(addQuiz, selectedGrade!);
        showMessage(context, "تم إضافة السؤال بنجاح", isError: false);
      } catch (e) {
        showMessage(context, "حدث خطأ أثناء التحميل. حاول مرة أخرى",
            isError: true);
      }
    } else {
      showMessage(context, "الرجاء ملء جميع الحقول", isError: true);
    }
  }

  @override
  Future<void> close() {
    option1Cont.dispose();
    option2Cont.dispose();
    option3Cont.dispose();
    option4Cont.dispose();
    correcrtAnswer.dispose();
    scoreCont.dispose(); // تنظيف الحقل الجديد
    return super.close();
  }
}
