import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_action.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_contenet.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_header.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_image.dart';
class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          

          const PostHeader(),
          const PostContent(),
          const PostImage(),
          const PostActions(),
        ],
      ),
    );
  }
}






