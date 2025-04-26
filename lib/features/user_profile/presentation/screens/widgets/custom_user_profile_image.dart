import 'package:flutter/material.dart';

class CustomUserIMageProfile extends StatelessWidget {
  const CustomUserIMageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 70,
        backgroundImage: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQCPrJP7yc9sWpppMDUoadLwYbGwvEpwj_Q&s",
        ),
      );
  }
}