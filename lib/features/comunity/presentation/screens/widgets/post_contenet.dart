import 'package:flutter/cupertino.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
