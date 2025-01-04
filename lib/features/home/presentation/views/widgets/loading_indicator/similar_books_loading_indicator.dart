import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_loading_indicator.dart';
import 'book_image_loading_indicator.dart';

class SimilarBooksLoadingIndicator extends StatelessWidget {
  const SimilarBooksLoadingIndicator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomLoadingIndicator(child:
    SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * .15,
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