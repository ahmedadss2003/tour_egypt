import 'package:flutter/material.dart';
import 'package:login/features/chatboot/presentation/views/chat_boot_view.dart';
import 'package:login/features/custom_trip/presentation/views/custom_trip_view.dart';
import 'package:login/features/home/presentation/views/home_view.dart';
import 'package:login/features/home/presentation/views/widgets/all_places_view.dart';
import 'package:login/features/splash/presentation/views/splash_view.dart';
import 'package:login/features/user_profile/presentation/screens/user_profile.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {

  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case UserProfile.routeName:
      return MaterialPageRoute(builder: (_) => const UserProfile());
    case ChatBotScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ChatBotScreen());
    case CustomTripView.routeName:
      return MaterialPageRoute(builder: (_) => const CustomTripView());
    case AllPlacesView.routeName:
      return MaterialPageRoute(builder: (_) => const AllPlacesView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}