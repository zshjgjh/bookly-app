import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilis/functions/launch_url.dart';
import 'action_button.dart';

class ButtonsBox extends StatelessWidget {
  const ButtonsBox({
    Key? key, required this.bookEntity,
  }) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(textColor: Colors.black,
          backgroundColor: Colors.white,
          text: getText(bookEntity: bookEntity),
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(16),
              bottomLeft:Radius.circular(16) ),
          onPressed: () {
          customLaunchUrl(context,bookEntity.infoLink);
          },
        ),
        ActionButton(textColor: Colors.white,
          backgroundColor: const Color(0xffEF8262),
          text: 'Free Preview',
          borderRadius: const BorderRadius.only(topRight:Radius.circular(16),
              bottomRight:Radius.circular(16) ),
          onPressed: () {
            customLaunchUrl(context, bookEntity.previewLink);
          },),

      ],
    );
  }

   String getText({required BookEntity bookEntity}) {
    if(bookEntity.infoLink==null){
      return 'Not available';
    }else{
      return'Download';
    }
  }
}