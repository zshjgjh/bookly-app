

import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utilis/styles.dart';
import 'book_image.dart';
import 'book_rating.dart';
import 'box_buttons.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    Key? key, required this.bookEntity,}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.30),
            child: const BookImage(imageUrl: '',),
          ),
          const SizedBox(height: 10,),
          Text(bookEntity.title??'',
            style: Styles.textStyle30.copyWith(fontFamily: kGtSectraFine,
                fontWeight: FontWeight.normal ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 3,),
          Text(bookEntity.authorName??'',
            style: Styles.textStyle14,),
          const SizedBox(height: 10,),
          BookRating(rating: bookEntity.rating??0,
            ratingCount:bookEntity.ratingCount??0 ,),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ButtonsBox(bookEntity: bookEntity,),
          ),
        ],
      ),
    );
  }
}