
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/features/home/data/services/api_services.dart';
import 'package:login/features/interests_view/presentation/views/interests_view.dart';

class CustomLoginWithGoogleAndFacebook extends StatelessWidget {
  const CustomLoginWithGoogleAndFacebook({super.key, required this.icon});
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(ApiServices().fetchPlaces());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  InterestsScreen();
        }));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple
        ),
        child:  Icon(
              icon ,
              color: Colors.white,
              size: 25, // Adjust size for smaller dimensions
            ),
      ),
    );
  }
}

void fetchDataFromFirebase() async {
  try {
    // Initialize Dio instance
    final dio = Dio();

    // Your Firebase Realtime Database URL (replace `.json` if it's not included)
    const String firebaseUrl = 'https://mygp-6522c-default-rtdb.firebaseio.com/.json';

    // Make GET request to fetch data
    Response response = await dio.get(firebaseUrl);

    // Log the data in the terminal
    if (response.statusCode == 200) {
      print('Data fetched successfully:');
      print(response.data);
    } else {
      print('Error fetching data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('An error occurred: $e');
  }
}