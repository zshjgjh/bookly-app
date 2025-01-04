import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/newest_books_item_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_loading_indicator.dart';

class NewestBooksLoadingIndicator extends StatelessWidget {
  const NewestBooksLoadingIndicator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate( (context,index) {
          return const NewestBooksItemLoadingIndicator();
        },
          childCount: 20
      )
    );
  }
  }
