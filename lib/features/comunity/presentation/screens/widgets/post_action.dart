import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  const PostActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          IconWithText(icon: Icons.thumb_up_alt_outlined, count: 12),
          IconWithText(icon: Icons.comment_outlined, count: 3),
          IconWithText(icon: Icons.share_outlined, count: 5),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final int count;

  const IconWithText({super.key, required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 4),
        Text(count.toString()),
      ],
    );
  }
}
