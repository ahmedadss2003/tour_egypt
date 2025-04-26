import 'package:flutter/cupertino.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.title, required this.padding});
  final String title ;
  final double padding ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
