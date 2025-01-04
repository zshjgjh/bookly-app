import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState(){
    animationController=AnimationController(vsync: this,
        duration: const Duration(milliseconds:800 ));

    animation=Tween<double>(begin: .2,
        end: .8)
        .animate(animationController);

    animationController.addListener(() {
      setState(() {

      });
    });
    animationController.repeat(reverse: true);
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Opacity(opacity:animation.value,
    child: widget.child,);
  }
}