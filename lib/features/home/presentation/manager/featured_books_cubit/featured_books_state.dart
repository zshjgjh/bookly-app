part of 'featured_books_cubit.dart';

@immutable
 class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

class FeaturedBooksFailureState extends FeaturedBooksState {
 final String errMessage;

  FeaturedBooksFailureState(this.errMessage);
}

class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
 final String errMessage;

 FeaturedBooksPaginationFailureState(this.errMessage);
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
 final List<BookEntity> books;

  FeaturedBooksSuccessState(this.books);
}
