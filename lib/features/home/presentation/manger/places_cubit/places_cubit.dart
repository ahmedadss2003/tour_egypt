import 'package:bloc/bloc.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/services/api_services.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesInitial());



 Future<void> fetchPlaces() async {
    try {
      emit(PlacesLoading()); 
      final places = await ApiServices().fetchPlaces();
      emit(PlacesLoaded(places)); 
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
  Future<void> fetchPlacesByInterests(List<String> interests) async {
    emit(PlacesLoading());
    try {
      if (interests.isEmpty) {
        // If no interests selected, fetch all places
        final places = await ApiServices().fetchPlaces();
        emit(PlacesLoaded(places));
      } else {
        final places = await ApiServices().fetchPlacesByInterests(interests);
        emit(PlacesLoaded(places));
      }
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
} 


/*
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/services/api_services.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final ApiServices apiServices;

  PlacesCubit(this.apiServices) : super(PlacesInitial());

  Future<void> fetchPlaces() async {
    emit(PlacesLoading());
    try {
      final places = await apiServices.fetchPlaces();
      emit(PlacesLoaded(places));
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }

  
   Future<void> fetchPlacesByInterestsAndLocation({
  required List<String> interests,
  double maxDistanceKm = 50.0, 
}) async {
  emit(PlacesLoading());
  try {
    // Get user's current location
    Position userPosition = await _determinePosition();
    print("User Location: Lat ${userPosition.latitude}, Long ${userPosition.longitude}");

    // Fetch all places from Firebase
    final allPlaces = await apiServices.fetchPlaces();
    print("Total Places Fetched: ${allPlaces.length}");

    // Filter places by interests and distance
    List<PlaceModel> filteredPlaces = allPlaces.where((place) {
      bool matchesInterest = interests.isEmpty || interests.contains(place.typeOfTourism);
      double distanceKm = _calculateDistance(
        userPosition.latitude,
        userPosition.longitude,
        place.lat,
        place.long,
      );
      print("Place: ${place.name}, Type: ${place.typeOfTourism}, Distance: $distanceKm km, Matches Interest: $matchesInterest");
      return matchesInterest && distanceKm <= maxDistanceKm;
    }).toList();

    print("Filtered Places: ${filteredPlaces.length}");
    if (filteredPlaces.isEmpty) {
      print("No places match interests $interests within $maxDistanceKm km");
    }

    // Sort by distance
    filteredPlaces.sort((a, b) {
      double distA = _calculateDistance(userPosition.latitude, userPosition.longitude, a.lat, a.long);
      double distB = _calculateDistance(userPosition.latitude, userPosition.longitude, b.lat, b.long);
      return distA.compareTo(distB);
    });

    emit(PlacesLoaded(filteredPlaces));
  } catch (e) {
    print("Error: $e");
    emit(PlacesError("Error fetching nearby places: $e"));
  }
}

  // Helper method to get user's location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check and request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    // Get current position
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // Haversine formula to calculate distance between two lat/long points (in kilometers)
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Earth's radius in kilometers
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
*/