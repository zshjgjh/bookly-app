import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import 'featured_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key, required this.bookEntity,}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            child: SizedBox(height: 10,)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('You may also like', style: Styles.textStyle18,),
        ),
        const SizedBox(height: 8,),

        SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .15,
            child:  SimilarBooksListView(bookEntity: bookEntity,))
      ],
    );
  }
}
