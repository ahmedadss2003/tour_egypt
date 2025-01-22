import 'package:flutter/material.dart';
import 'package:login/features/onbording_screen/presentation/views/widgets/onbording_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: OnBordingViewBody(),
    );
  }
}