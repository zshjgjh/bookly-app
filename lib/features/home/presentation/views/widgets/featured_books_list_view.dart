import 'package:basketball_counter_app/core/utilis/asset_data.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/books_list_view_image.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/featured_books_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pagenation_books_list-view.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key,}) : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  List<BookEntity> allBooks=[];
  @override
  Widget build(BuildContext context) {
    int nextPage=1;
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener:(context, state){
        if(state is FeaturedBooksSuccessState){
          allBooks.addAll(state.books);
        }
        if(state is FeaturedBooksPaginationFailureState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage))
          );
        }
      } ,
      builder: (context, state) {
        if(state is FeaturedBooksSuccessState||
        state is FeaturedBooksPaginationLoadingState||
        state is FeaturedBooksPaginationFailureState){
          return  PagenationBooksListView(books: allBooks,
            getBooks: BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks(pageNumber: nextPage++),
            );
      }  if(state is FeaturedBooksFailureState){
        return Center(child: Text(state.errMessage));
    }else {
          return const FeaturedBooksLoadingIndicator();
        }

  }
    );
}
}

