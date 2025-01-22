import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomEntranceFeesForForeigners extends StatelessWidget {
  const CustomEntranceFeesForForeigners({super.key, required this.place});
  final PlaceModel place ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text("Entrance fees For Foreigners: ", style: AppStyles.textStyle18Black,),
        Text(place.entryFeesForForeigners, style: AppStyles.textStyle18,)
    ]);
  }
}