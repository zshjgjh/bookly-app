import 'package:basketball_counter_app/core/widgets/custom_loading_indicator.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/loading_indicator/book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class NewestBooksItemLoadingIndicator extends StatelessWidget {
const NewestBooksItemLoadingIndicator({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return  CustomLoadingIndicator(
  child: Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: SizedBox(
      height: 125,
      child: Row(
        children: [
          const BookImageLoadingIndicator(),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  color: Colors.grey[50],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 10,
                  width: 200,
                  color: Colors.grey[50],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[50],
                )

              ],),),],),),),
);
}
}
