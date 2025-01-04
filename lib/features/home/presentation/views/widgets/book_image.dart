

import 'package:basketball_counter_app/core/utilis/asset_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BookImage extends StatelessWidget {
  const BookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1.5/2,
        child:CachedNetworkImage(
          imageUrl:imageUrl,
        errorWidget: (context, url, error) => const Icon(Icons.error),//Text(error.toString())
        fit: BoxFit.fill,),
      ),
    );
  }
}