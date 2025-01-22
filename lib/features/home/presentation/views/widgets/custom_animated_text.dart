
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  const CustomAnimatedTextKit({super.key});

  @override

  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "Your comprehensive guide in one place",
          
          speed: const Duration(milliseconds: 100),
          textAlign: TextAlign.center,
          textStyle: AppStyles.textStyle18Black.copyWith(
            color: Colors.white
          )
          
          ),
      ],
      totalRepeatCount: 1,

      );
  }
}