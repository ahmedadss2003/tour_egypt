import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomEntranceFees extends StatelessWidget {
  const CustomEntranceFees({super.key, required this.place});
  final PlaceModel place ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Text("Entrance fees: ", style: AppStyles.textStyle18Black,),
        Text(place.entranceFees, style: AppStyles.textStyle18,)
      ],
    );
  }
}