
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utilis/app_routers.dart';
import 'animation_widget.dart';

class SplashViewBody extends StatefulWidget{
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;


  @override
  void initState(){
    super.initState();
    slidingAnimationMethod();
    navigateHome();
  }


  @override
  void dispose(){
    super.dispose();
    animationController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return AnimationWidget(slidingAnimation: slidingAnimation, fadeAnimation: fadeAnimation);
  }



  void slidingAnimationMethod() {
    animationController=AnimationController(vsync:this,
        duration: const Duration(seconds: 3));

    slidingAnimation=Tween<Offset>(begin: const Offset(0,2),
        end: const Offset(0, 0))
        .animate(animationController);

    fadeAnimation=Tween<double>(begin: 0,
        end: 1)
        .animate(animationController);


    animationController.forward();
  }
  void navigateHome() {
    Future.delayed(const Duration(seconds: 5),(){
      GoRouter.of(context).push(AppRouters.kHomeView);
     // Get.to(() => const HomeView(),transition:Transition.fade,duration: kTransitionDuration ); /get materialapp package/
    });
  }
}





