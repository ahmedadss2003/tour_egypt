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
  final String? backgroundImage; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundImage == null ? LinearGradient(colors: colors) : null, // Use gradient if no background image
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!), // Use AssetImage for local image
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Column(
        children: [
          const SizedBox(height: 120),
          if (img.isNotEmpty) // Only show the image if the `img` is not empty
            CachedNetworkImage(
              imageUrl: img,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          const SizedBox(height: 70),
          Text(
            title,
            style: AppStyles.textStyle22,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}