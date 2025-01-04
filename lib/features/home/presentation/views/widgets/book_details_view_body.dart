import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constant.dart';
import '../../../../../core/utilis/styles.dart';
import 'action_button.dart';
import 'book_datails_section.dart';
import 'book_rating.dart';
import 'box_buttons.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookEntity}) : super(key: key);

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {

    return   CustomScrollView(
      slivers:  [
        SliverToBoxAdapter(
          child: BookDetailsSection(bookEntity: bookEntity,),
        ),

         SliverFillRemaining(
          hasScrollBody: false,
          child: SimilarBooksSection(bookEntity: bookEntity,),
        )


      ],

    );
  }
}




