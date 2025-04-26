
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/core/services/api_services.dart';
import 'package:login/features/home/presentation/views/home_view.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key, required this.icon});
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(ApiServices().fetchPlaces());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  const HomeView();
        }));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 198, 154, 154)
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
    final dio = Dio();

    const String firebaseUrl = 'https://mygp-6522c-default-rtdb.firebaseio.com/.json';

    Response response = await dio.get(firebaseUrl);

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