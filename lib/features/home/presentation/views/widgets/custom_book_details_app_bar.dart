import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {
          Navigator.of(context).pop();
        },
            icon: const Icon(Icons.close,
              size: 25,)),
        IconButton(onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping,
              size: 25,))
      ],
    );
  }
}