import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';
import 'package:schoolacademy/feature/dash_board/books_screen/repository/books_repository.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  final BooksRepository repository = BooksRepository();

  Future<void> fetchBooks() async {
    emit(BooksLoading());

    final bookResult = await repository.fetchClasses('book');

    final booksResult = await repository.fetchClasses('book');

    bookResult.fold((failure) {
      emit(BooksError(failure.message));
    }, (primaryClasses) {
      booksResult.fold((failure) {
        emit(BooksError(failure.message));
      }, (books) {
        emit(BooksLoaded(
          books: books,
        ));
      });
    });
  }
}
