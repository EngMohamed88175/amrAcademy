import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolacademy/core/utils/firebase/database.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/logic/cubit/question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  Future<void> fetchQuestions(String category) async {
    emit(QuestionLoading());

    try {
      final Stream quizStream =
          await DatabaseMethods().getCategoryQuiz(category);

      quizStream.listen((snapshot) {
        final questions = snapshot.docs as List<DocumentSnapshot>;
        final showAnswers = List.generate(questions.length, (index) => false);
        emit(QuestionLoaded(questions, showAnswers));
      });
    } catch (e) {
      emit(QuestionError(e.toString()));
    }
  }

  void toggleShowAnswer(int index) {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      final updatedShowAnswers = List<bool>.from(currentState.showAnswers);
      updatedShowAnswers[index] = true;

      emit(QuestionLoaded(currentState.questions, updatedShowAnswers));
    }
  }

  void finishExam() {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      emit(QuestionLoaded(currentState.questions, currentState.showAnswers,
          isExamFinished: true));
    }
  }

  // دالة جديدة لحساب النقاط
  int calculateScore(
      List<DocumentSnapshot> questions, List<String> userAnswers) {
    int totalScore = 0;

    for (int i = 0; i < questions.length; i++) {
      final data = questions[i].data() as Map<String, dynamic>?;
      final correctAnswer = data?["correct"] as String?;
      final questionScore = data?["score"] as int? ?? 0;

      if (userAnswers[i] == correctAnswer) {
        totalScore += questionScore;
      }
    }

    return totalScore;
  }
}
