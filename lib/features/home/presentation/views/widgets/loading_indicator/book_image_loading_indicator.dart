import 'package:flutter/material.dart';

class BookImageLoadingIndicator extends StatelessWidget {
  const BookImageLoadingIndicator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1.5/2,
        child:Container(
          color: Colors.grey[50],
        )
    )
    );
  }
}