
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
 final FetchFeaturedBooksUseCase featuredBooksUseCase;

 Future<void> getFeaturedBooks({int pageNumber=0}) async{
   if (pageNumber==0) {
     emit(FeaturedBooksLoadingState());
   }else{
     emit(FeaturedBooksPaginationLoadingState());
   }
   var result= await featuredBooksUseCase.call(pageNumber);

   result.fold((failure) {
     if (pageNumber==0) {
       emit(FeaturedBooksFailureState(failure.errorMessage));
     }else{
       emit(FeaturedBooksPaginationFailureState(failure.errorMessage));
     }
   }, (books) {
     emit(FeaturedBooksSuccessState(books));
   });
 }
}
