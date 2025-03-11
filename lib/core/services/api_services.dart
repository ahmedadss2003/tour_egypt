import 'package:dio/dio.dart';
import 'package:login/core/models/place_data_model.dart';

class ApiServices {
  final Dio dio = Dio();
  final String firebaseUrl = 'https://mygp-6522c-default-rtdb.firebaseio.com/.json'; 

  Future<List<PlaceModel>> fetchPlaces() async {
  try {
    final response = await dio.get(firebaseUrl);

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((placeJson) => PlaceModel.fromJson(Map<String, dynamic>.from(placeJson))).toList();
    } else {
      throw Exception("Failed to load places");
    }
  } catch (e) {
    throw Exception("Error fetching data: $e");
  }
}

  Future<List<PlaceModel>> fetchPlacesByInterests(List<String> interests) async {
    try {
      final response = await dio.get(firebaseUrl);

      if (response.statusCode == 200) {
        List<Map<String , dynamic>> data = response.data;
        List<PlaceModel> allPlaces = data
            .map((placeJson) {
              return PlaceModel.fromJson(Map<String, dynamic>.from(placeJson));
            })
            .toList();

        // Filter places where "type of tourism" matches any of the selected interests
        List<PlaceModel> filteredPlaces = allPlaces
            .where((place) => interests.contains(place.typeOfTourism))
            .toList();
        
        return filteredPlaces;
      } else {
        throw Exception("Failed to load places");
      }
    } catch (e) {
      throw Exception("Error fetching data by interests: $e");
    }
  }

}


