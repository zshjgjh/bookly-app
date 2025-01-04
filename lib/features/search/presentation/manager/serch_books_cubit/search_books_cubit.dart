import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo_implement.dart';
part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepoImpl) : super(SearchBooksInitial());

  final SearchRepoImpl searchRepoImpl;

  Future<void> getSearchBooks({required String category}) async{
    emit(SearchBooksLoadingState ());
    var result= await searchRepoImpl.searchBooks(category: category);
    result.fold((failure) {
      emit(SearchBooksFailureState(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SearchBooksSuccessState(books: books));
    });
  }
}
