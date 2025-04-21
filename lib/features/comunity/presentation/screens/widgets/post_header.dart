import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.imageUrl});
  final String imageUrl ;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl ,
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
