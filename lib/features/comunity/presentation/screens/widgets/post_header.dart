import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQCPrJP7yc9sWpppMDUoadLwYbGwvEpwj_Q&s', // Replace this with a direct avatar image URL
        ),
      ),
      title: Text(
        'Ahmed Ashraf',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('12 hours ago'),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
