import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomOnbordingpage extends StatelessWidget {
  const CustomOnbordingpage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.colors,
    this.backgroundImage, // Add this parameter
  });

  final String title;
  final String subTitle;
  final String img;
  final List<Color> colors;
  final String? backgroundImage; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundImage == null ? LinearGradient(colors: colors) : null, 
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!), 
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Column(
        children: [
          const SizedBox(height: 120),
          if (img.isNotEmpty) 
            CachedNetworkImage(
              imageUrl: img,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          const SizedBox(height: 70),
          Text(
            title,
            style: AppStyles.textStyle22.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14 ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle14.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}