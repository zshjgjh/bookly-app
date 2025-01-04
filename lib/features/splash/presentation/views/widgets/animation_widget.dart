import 'package:flutter/material.dart';

import '../../../../../core/utilis/asset_data.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({
    Key? key,
    required this.slidingAnimation,
    required this.fadeAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return Opacity(
            opacity: fadeAnimation.value,
            child: SlideTransition(
              position: slidingAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetData.logo),
                  const SizedBox(height: 2,),
                  const Text('read books for free',
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          );
        }
    );
  }
}