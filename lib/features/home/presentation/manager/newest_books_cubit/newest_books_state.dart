part of 'newest_books_cubit.dart';

@immutable
class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksPaginationLoadingState extends NewestBooksState {}


class NewestBooksFailureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailureState(this.errorMessage);
}


class NewestBooksPaginationFailureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFailureState(this.errorMessage);
}

class NewestBooksSuccessState extends NewestBooksState {
 final List<BookEntity> books;

  NewestBooksSuccessState(this.books);
}




