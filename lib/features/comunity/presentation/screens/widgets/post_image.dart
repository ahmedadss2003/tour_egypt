import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.imageUrl, required this.padding});

  final String imageUrl;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 10 / 9, 
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity, 
          ),
        ),
      ),
    );
  }
}
