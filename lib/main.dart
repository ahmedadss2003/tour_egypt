import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/helper_function/helper_function.dart';
import 'package:login/core/utils/app_colors.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
import 'package:login/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TourEgyptApp());
}

class TourEgyptApp extends StatelessWidget {
  const TourEgyptApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlacesCubit>(
      create: (context) => PlacesCubit(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
