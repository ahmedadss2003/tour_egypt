

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:login/features/home/data/models/cities.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.cities,
  });

  final List<Cities> cities;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
     itemCount: cities.length, 
     itemBuilder: (context,index,realindex){
       final city = cities[index];
       return Card(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         child: ClipRRect(
           borderRadius: BorderRadius.circular(12),
           child:Stack(
             fit: StackFit.expand,
             children: [
               Image.network(
                 city.image,
                 fit: BoxFit.cover,
                 loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) {
                    return child;
                   } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value:loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1),
                          color: Colors.purple,
                          strokeWidth: 4,
                      )
                    );
                   }
                 },
               ),
               Container(
                 alignment: Alignment.bottomCenter,
                 color: Colors.black.withOpacity(0.1),
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   city.name,
                   style: const TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ],
           )
         ),
       );
       
     },
     options: CarouselOptions(
       height: 200, 
       autoPlay: true, 
       autoPlayInterval: const Duration(milliseconds: 2500),
       enlargeCenterPage: true, // Enlarges the focused item
       viewportFraction: 0.8, // Fraction of screen occupied by one card
     ),
    );
  }
}

