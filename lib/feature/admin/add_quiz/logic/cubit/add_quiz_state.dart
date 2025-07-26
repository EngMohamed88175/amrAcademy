part of 'add_quiz_cubit.dart';

sealed class AddQuizState extends Equatable {
  const AddQuizState();

  @override
  List<Object> get props => [];
}

final class AddQuizInitial extends AddQuizState {}

class AddQuizGradeChanged extends AddQuizState {
  final String grade;

  const AddQuizGradeChanged(this.grade);

  @override
  List<Object> get props => [grade];
}
class AddQuizImageSelected extends AddQuizState {
  // final File image;

  // const AddQuizImageSelected(this.image);
}