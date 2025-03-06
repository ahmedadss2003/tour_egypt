import 'package:flutter/material.dart';
import 'package:login/features/custom_trip/presentation/views/widgets/custom_trip_view_body.dart';

class CustomTripView extends StatelessWidget {
  const CustomTripView({super.key});
  static const routeName = "CustomTripView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body:  CustomTripViewBody(),
    );
  }
}