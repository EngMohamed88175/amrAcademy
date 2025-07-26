part of 'home_cubit.dart';

sealed  class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeGradeSelected extends HomeState {
  final String stage;
  final int selectedGradeIndex;

  const HomeGradeSelected({required this.stage, required this.selectedGradeIndex});
}

final class HomeLoading extends HomeState {}

final class HomeBooksLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ClassesGradePrimaryModel> primaryClasses;
  final List<ClassesGradePrimaryModel> preparatoryClasses;
  final List<BookScoolGradeModel> books;

  const HomeLoaded({
    required this.primaryClasses,
    required this.preparatoryClasses,
    required this.books,
  });

  @override
  List<Object> get props => [primaryClasses, preparatoryClasses, books];
}
class HomeBooksLoaded extends HomeState {
  final List<BookScoolGradeModel> books;

  const HomeBooksLoaded({ required this.books});

}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}

final class HomeBooksError extends HomeState {
  final String message;

  const HomeBooksError(this.message);

  @override
  List<Object> get props => [message];
}
