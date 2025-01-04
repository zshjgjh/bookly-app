
import 'package:basketball_counter_app/constant.dart';
import 'package:basketball_counter_app/core/utilis/app_routers.dart';
import 'package:basketball_counter_app/core/utilis/styles.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({Key? key, required this.bookEntity,}) : super(key: key);
  final BookEntity bookEntity;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouters.kBookDetails,extra: bookEntity);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
               BookImage(imageUrl: bookEntity.image??'',),
              const SizedBox(width: 20,),
               Expanded(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(bookEntity.title??'',
                     style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,),
                     const SizedBox(height: 3,),
                     Text(bookEntity.authorName??'',
                     style: Styles.textStyle14,),
                     const SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Free',
                         style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),),
                         const SizedBox(width: 12,),
                          BookRating(rating: bookEntity.rating??3.8,
                           ratingCount: bookEntity.ratingCount??2354,)

                       ],
                     )
                   ],
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}

