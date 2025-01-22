import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/core/utils/app_colors.dart';
import 'package:login/features/splash/presentation/views/splash_view.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TourEgyptApp());
}

class TourEgyptApp extends StatelessWidget {
  const TourEgyptApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      
    );
  }
}
