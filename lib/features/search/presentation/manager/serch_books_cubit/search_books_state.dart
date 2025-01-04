part of 'search_books_cubit.dart';

@immutable
class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoadingState extends SearchBooksState {}


class SearchBooksSuccessState extends SearchBooksState {
  final List<BookModel> books;

  SearchBooksSuccessState({required this.books});
}

class SearchBooksFailureState extends SearchBooksState {
  final String errorMessage;

  SearchBooksFailureState({required this.errorMessage});
}
