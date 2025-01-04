import 'package:basketball_counter_app/core/utilis/asset_data.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/similar_books_loading_indicator.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/pagenation_books_list-view.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/books_list_view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  List<BookEntity>  allBooks=[];
  @override
  Widget build(BuildContext context) {
    int nextPage=1;
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
        listener: (context,state){
          if(state is SimilarBooksSuccessState){
            allBooks.addAll(state.books);
          }
          if(state is SimilarBooksPaginationFailureState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage))
            );
          }
        },
        builder: (context, state) {
          if(state is SimilarBooksSuccessState ||
          state is SimilarBooksPaginationLoadingState ||
          state is SimilarBooksPaginationFailureState){
            return PagenationBooksListView(books: allBooks,
              getBooks: BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(category:widget.bookEntity.category!,
                  pageNumber: nextPage++ ),
              );

          } if(state is SimilarBooksFailureState){
            return Center(child: Text(state.errorMessage));
          }else {
            return const SimilarBooksLoadingIndicator();
          }

        }
    );
  }
}
