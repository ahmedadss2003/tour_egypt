import 'package:flutter/material.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_action.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_contenet.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_header.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_image.dart';
class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.text, this.imageUrl, required this.name, required this.likesCount, required this.postId});
  final String text;
  final String? imageUrl;
  final String name ;
   final int likesCount;
  final int postId;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),  
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child:  Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          PostHeader(
            name: name,
            imageUrl: imageUrl ?? "https://pubqxndstnzehanamrag.supabase.co/storage/v1/object/public/postimage/private/1745162255211790_1000570721.jpg",
          ),
          PostContent(
            padding: 16,
            title: text,
          ),
          PostImage(
            padding: 16,
            imageUrl: imageUrl?? "https://pubqxndstnzehanamrag.supabase.co/storage/v1/object/public/postimage/private/1745162255211790_1000570721.jpg",
          ),
           PostActions(
            likesCount: likesCount,
            postId: postId,
          ),
        ],
      ),
    );
  }
}






