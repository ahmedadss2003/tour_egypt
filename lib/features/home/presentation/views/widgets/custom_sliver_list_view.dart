import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/home/presentation/views/widgets/custom_cities_image.dart';

class CustomSliverListView extends StatelessWidget {
  const CustomSliverListView({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: CustomCitiesCard(
            place: places[index],
          ),
        ),
        childCount: places.length, // Number of list items
      ),
    );
  }
}
