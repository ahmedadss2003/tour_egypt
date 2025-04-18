import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/home/presentation/views/widgets/custom_cities_card.dart';

class CustomSliverListView extends StatelessWidget {
  const CustomSliverListView({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: ListView.builder(
        scrollDirection: Axis.horizontal, // ✅ Keep scrolling horizontal
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomCitiesCard(place: places[index]),
          );
        },
      ),
      );
    
  }
}
