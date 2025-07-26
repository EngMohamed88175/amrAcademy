import 'package:cloud_firestore/cloud_firestore.dart';

sealed class QuestionState {
  const QuestionState();
}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionTimerFinished extends QuestionState {}

final class IsExamFinish extends QuestionState {
  final bool isExamFinished;

  const IsExamFinish(this.isExamFinished);
}

final class QuestionLoaded extends QuestionState {
  final List<DocumentSnapshot> questions;
  final List<bool> showAnswers;
  final bool isExamFinished; // حالة انتهاء الامتحان

  const QuestionLoaded(this.questions, this.showAnswers,
      {this.isExamFinished = false});
}

final class QuestionError extends QuestionState {
  final String message;

  const QuestionError(this.message);
}

class QuestionTimerUpdated extends QuestionState {
  final Duration remainingTime;

  const QuestionTimerUpdated(this.remainingTime);
}
