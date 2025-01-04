part of 'similar_books_cubit.dart';

@immutable
class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksPaginationLoadingState extends SimilarBooksState {}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccessState({required this.books});
}

class SimilarBooksFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailureState({required this.errorMessage});
}

class SimilarBooksPaginationFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksPaginationFailureState({required this.errorMessage});
}
