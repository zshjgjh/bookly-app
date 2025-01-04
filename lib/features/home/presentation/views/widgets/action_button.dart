import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.textColor,
    required this.backgroundColor,
    required this.text,
    this.borderRadius,
    required this.onPressed
  }) : super(key: key);
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final BorderRadius? borderRadius;
  final void Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 35,
        child: TextButton(onPressed:onPressed,
            child: Text(text,
              style: Styles.textStyle20.copyWith(
                color: textColor
              ),),
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius??BorderRadius.circular(16)
              )
            )
        ),
      ),
    );
  }
}