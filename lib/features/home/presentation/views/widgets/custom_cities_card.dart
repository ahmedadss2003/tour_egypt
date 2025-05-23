import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/detailes_view/presentation/view/detailes_view.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';

class CustomCitiesCard extends StatelessWidget {
const CustomCitiesCard({super.key, required this.place});

final PlaceModel place;

double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
const double earthRadius = 6371;
double dLat = (lat2 - lat1) * pi / 180;
double dLon = (lon2 - lon1) * pi / 180;
double a = sin(dLat / 2) * sin(dLat / 2) +
    cos(lat1 * pi / 180) * cos(lat2 * pi / 180) * sin(dLon / 2) * sin(dLon / 2);
double c = 2 * atan2(sqrt(a), sqrt(1 - a));
return earthRadius * c;
}

@override
Widget build(BuildContext context) {
return BlocBuilder<PlacesCubit, PlacesState>(
  builder: (context, state) {
    double distanceKm = 0.0;
    if (state is PlacesLoaded) {
      distanceKm = _calculateDistance(
        state.userPosition.latitude,
        state.userPosition.longitude,
        place.lat,
        place.long,
      );
    }

    return SizedBox(
      height: 220,
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (state is PlacesLoaded) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailsView(
                        place: place,
                        userPosition: state.userPosition, // Pass from Cubit
                      );
                    }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailsView(place: place); // Fallback without position
                    }));
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: place.imageUrl,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(Icons.bookmark, color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "${distanceKm.toStringAsFixed(1)} km",
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(place.name, style: AppStyles.textStyle18.copyWith(fontFamily: "ZillaSlab",color: const Color.fromARGB(255, 32, 16, 123))),
              ),
              Center(
                child: Text(
                  place.typeOfTourism,
                  style: AppStyles.textStyle18.copyWith(fontFamily: "ZillaSlab", color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
}
}