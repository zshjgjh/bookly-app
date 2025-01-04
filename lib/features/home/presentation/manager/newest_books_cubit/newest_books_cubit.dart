import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> getNewestBooks({int pageNumber=0}) async{
    if (pageNumber==0) {
      emit(NewestBooksLoadingState ());
    }else{
      emit(NewestBooksPaginationLoadingState());
    }

    var result= await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber==0) {
        emit(NewestBooksFailureState(failure.errorMessage));
      }else{
        emit(NewestBooksPaginationFailureState(failure.errorMessage));
      }
    }, (books) {
        emit(NewestBooksSuccessState(books));

    });

  }
}
