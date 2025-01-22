import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomWorkHoursWidget extends StatelessWidget {
  const CustomWorkHoursWidget({super.key, required this.place});
  final PlaceModel place ;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
       
        const Text("Work hours: ", style: AppStyles.textStyle18Black,),
        
        Text(place.workHours, style: AppStyles.textStyle18,)
      ],
    );
  }

}