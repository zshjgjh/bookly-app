import 'package:basketball_counter_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/books_list_view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/serch_books_cubit/search_books_cubit.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if(state is SearchBooksSuccessState) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 4.0),
                  child: NewestBooksItem(bookEntity: state.books[index],),
                );
              }
          );
        }else if(state is SearchBooksFailureState){
          return Center(child: Text(state.errorMessage));
        }else if(state is SearchBooksLoadingState){
          return const Center(child: CircularProgressIndicator());
        } else{
          return const Center(child:Text('Please Type book name')
          );
        }
      },
    );
  }
}