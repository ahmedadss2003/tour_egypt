import 'package:flutter/cupertino.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'This place is amazing! The food is great and the staff is super friendly.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
