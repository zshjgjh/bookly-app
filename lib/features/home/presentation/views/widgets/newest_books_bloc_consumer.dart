
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/newest_book_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_item.dart';

BlocConsumer<NewestBooksCubit, NewestBooksState> NewestBooksBlocConsumer() {

  List<BookEntity> allBooks=[];
  return BlocConsumer<NewestBooksCubit, NewestBooksState>(
    listener: (context,state){

      if(state is NewestBooksSuccessState){
        allBooks.addAll(state.books);
      }
      if(state is NewestBooksPaginationFailureState){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(state.errorMessage))
        );
      }
    },
    builder: (context, state) {
      if(state is NewestBooksSuccessState ||
          state is NewestBooksPaginationLoadingState ||
      state is NewestBooksPaginationFailureState) {  //to keep books list without indicator or error messeage when scrolling
        return SliverList(
          delegate:SliverChildBuilderDelegate( (context,index){
            return  NewestBooksItem(bookEntity: allBooks[index]);},
              childCount:allBooks.length
          ),);
      }else if(state is NewestBooksFailureState){
        return SliverToBoxAdapter(
            child: Center(
                child: Text(state.errorMessage)));
      }else{
        return const NewestBooksLoadingIndicator();
      }
    },
  );
}

