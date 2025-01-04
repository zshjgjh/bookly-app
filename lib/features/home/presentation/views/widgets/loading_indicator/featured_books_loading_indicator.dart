import 'package:basketball_counter_app/core/widgets/custom_loading_indicator.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../books_list_view_image.dart';

class FeaturedBooksLoadingIndicator extends StatelessWidget {
  const FeaturedBooksLoadingIndicator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomLoadingIndicator(child:
    SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * .27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: BookImageLoadingIndicator()
            );
          }

      ),
    )

    );
  }
}