import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/constant.dart';
import 'package:login/core/helper_function/helper_function.dart';
import 'package:login/core/services/api_services.dart';
import 'package:login/core/services/service_locator.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
import 'package:login/features/splash/presentation/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: subapaseUrl,
    anonKey: subapaseKey,
  );
  setupServiceLocator();
  runApp(const TourEgyptApp());
}

class TourEgyptApp extends StatelessWidget {
  const TourEgyptApp({super.key});
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return BlocProvider<PlacesCubit>(
      create: (context) => PlacesCubit(apiServices),
      child: const MaterialApp(
        
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
