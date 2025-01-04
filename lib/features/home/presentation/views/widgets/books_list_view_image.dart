

import 'package:basketball_counter_app/core/utilis/asset_data.dart';
import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilis/app_routers.dart';

class BooksListViewImage extends StatelessWidget {
  const BooksListViewImage({Key? key, required this.bookEntity,}) : super(key: key);

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouters.kBookDetails,extra:bookEntity );
      },
      child:  BookImage(imageUrl: bookEntity.image??'',)
    );
  }
}