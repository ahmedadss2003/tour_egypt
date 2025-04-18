import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQCPrJP7yc9sWpppMDUoadLwYbGwvEpwj_Q&s', // Replace this with a direct image URL
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
