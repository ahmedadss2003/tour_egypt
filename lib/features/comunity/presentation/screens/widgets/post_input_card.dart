import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostInputCard extends StatelessWidget {
  final VoidCallback onTap;

  const PostInputCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: const Padding(
          padding:  EdgeInsets.all(16),
          child:  Row(
            children: [
               CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQCPrJP7yc9sWpppMDUoadLwYbGwvEpwj_Q&s'), // صورة اليوزر
              ),
               SizedBox(width: 12),
               Expanded(
                child: Text(
                  "What's on your mind?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}