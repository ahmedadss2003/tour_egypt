import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login/features/onbording_screen/presentation/views/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "SplashView";
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/lottie/Animation - 1728507729824.json"),
          )
        ],
      ),
      splashIconSize: 400, 
      duration: 5000,
      nextScreen:const OnboardingView(),
      
    );
  }
}