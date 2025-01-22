class PlaceModel {
  final String name;
  final String governmentName;
  final String imageUrl;
  final String workHours;
  final String entranceFees;
  final String entryFeesForForeigners;
  final String location;
  final String typeOfTourism;
  final String description;
  final double lat;
  final double long;

  PlaceModel({
    required this.name,
    required this.governmentName,
    required this.imageUrl,
    required this.workHours,
    required this.entranceFees,
    required this.entryFeesForForeigners,
    required this.location,
    required this.typeOfTourism,
    required this.description,
    required this.lat,
    required this.long,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'] ?? '',
      governmentName: json['government_name'] ?? '',
      imageUrl: json['image_url'] ?? '',
      workHours: json['work_hours'] ?? '',
      entranceFees: json['Entrance_fees'] ?? '',
      entryFeesForForeigners: json['entry_fees_for_foreigners'] ?? '',
      location: json['location'] ?? '',
      typeOfTourism: json['type of tourism'] ?? '',
      description: json['description'] ?? '',
      // Safely parse Lat and Long as double, providing a fallback value (0.0)
      lat: _parseDouble(json['Lat']),
      long: _parseDouble(json['Long']),
    );
  }

  // Helper function to safely parse a string to a double, returning 0.0 if invalid
  static double _parseDouble(dynamic value) {
    if (value == null) {
      return 0.0; // If value is null, return 0.0
    }
    try {
      return double.parse(value.toString()); // Try parsing the value
    } catch (e) {
      return 0.0; // If parsing fails, return 0.0
    }
  }

  // Convert the model into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'government_name': governmentName,
      'image_url': imageUrl,
      'work_hours': workHours,
      'Entrance_fees': entranceFees,
      'entry_fees_for_foreigners': entryFeesForForeigners,
      'location': location,
      'type_of_tourism': typeOfTourism,
      'description': description,
      'Lat': lat,
      'Long': long,
    };
  }
}
