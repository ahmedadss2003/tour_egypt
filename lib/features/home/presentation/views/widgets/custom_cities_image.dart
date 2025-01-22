import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/detailes_view/presentation/view/detailes_view.dart';

class CustomCitiesCard extends StatelessWidget {
  const CustomCitiesCard({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailsView(
                  place: place,
                );
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Stack(
                children: [
                  // Background Image
                  CachedNetworkImage(
                    imageUrl: place.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  // Bookmark Icon
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
                        child: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Distance Text Overlay
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        "km",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  // Place Name at Bottom Center
                 
                ],
              ),
            ),
          ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(place.name ,style: AppStyles.textStyle18.copyWith(fontFamily: "ZillaSlab"),),
            ),
            Center(child: Text("${place.typeOfTourism}",style: AppStyles.textStyle18.copyWith(fontFamily: "ZillaSlab" , color: Colors.black),)),
          ],
        ),
      ),
    );
  }
}
