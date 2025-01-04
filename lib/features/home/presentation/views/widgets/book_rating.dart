import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utilis/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.ratingCount}) : super(key: key);
  final num rating;
  final num ratingCount;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$rating($ratingCount)',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),),
        const Icon(FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,),
        const SizedBox(width: 6.3,),
      ],
    );
  }
}