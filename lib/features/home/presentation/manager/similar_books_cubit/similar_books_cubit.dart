import 'package:basketball_counter_app/core/use_case/use_case.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/domain/use_case/fetch_similar_books_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> getSimilarBooks({required String category,int pageNumber=0}) async{
    if (pageNumber==0) {
      emit(SimilarBooksLoadingState ());
    }else{
      emit(SimilarBooksPaginationLoadingState());
    }
    var result= await fetchSimilarBooksUseCase.call(category,pageNumber);
    result.fold((failure) {
      if (pageNumber==0) {
        emit(SimilarBooksFailureState(errorMessage: failure.errorMessage));
      }else{
        emit(SimilarBooksFailureState(errorMessage: failure.errorMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccessState(books: books));
    });
  }
}
