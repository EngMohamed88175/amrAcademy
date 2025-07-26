part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksInitial {}

final class BooksError extends BooksState {
  final String message;

  const BooksError(this.message);

  @override
  List<Object> get props => [message];
}

class BooksLoaded extends BooksState {
  final List<BookScoolGradeModel> books;

  const BooksLoaded({
    required this.books,
  });
}
