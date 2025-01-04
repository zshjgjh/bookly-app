import 'package:basketball_counter_app/features/home/presentation/views/widgets/newest_books_bloc_consumer.dart';
import 'package:basketball_counter_app/features/search/presentation/views/widgets/search_box.dart';
import 'package:basketball_counter_app/features/search/presentation/views/widgets/serch_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBox()
          ),
          SliverFillRemaining(
            child: SearchBooksListView(),
          )

        ],
      ),
    );
  }
}