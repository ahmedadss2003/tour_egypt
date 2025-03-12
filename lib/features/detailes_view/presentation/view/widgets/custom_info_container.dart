
import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_button.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_divider.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_entrance_fees.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_ntranceFees_for_foreigners.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_place_name_row.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_work_hours.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer({super.key, required this.place});
  final PlaceModel place ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(16.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPlaceNameRow(
            place: place,
          ),     
          const CustomDivider(),    
          const SizedBox(height: 10,),
          CustomDirectionsButton(
            locationUrl: place.location,
          ),
          const SizedBox(height: 10,),
          ExpansionTile(
          title: const Text(
            "Description",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Title color when expanded
            ),
          ),
            backgroundColor: const Color.fromARGB(255, 45, 45, 45), 
            collapsedBackgroundColor: const Color.fromARGB(255, 8, 3, 74), 
            collapsedTextColor: Colors.purple, 
            textColor: Colors.white, 
            iconColor: Colors.white,
            collapsedIconColor: Colors.white, 
            childrenPadding: const EdgeInsets.all(16), 
            tilePadding: const EdgeInsets.symmetric(horizontal: 16), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), 
            ),
            children: [
              InteractiveViewer(
                child: Text(
                place.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              
              ),),
              const SizedBox(height: 10), // Spacing between text and additional content
              const Icon(
                Icons.description,
                color: Colors.white,
                size: 30,
              ), // Example of additional content
            ],
          ),
          const CustomDivider(),
          CustomWorkHoursWidget(
            place: place,
          ),
          const CustomDivider(),
          CustomEntranceFees(
            place: place,
          ),
          const CustomDivider(),
          CustomEntranceFeesForForeigners(
            place: place,
          ),
        ],
      ),
    );
  }
}


