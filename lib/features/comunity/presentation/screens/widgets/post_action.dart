import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';

class PostActions extends StatelessWidget {
  final int likesCount;
  final int postId;

  const PostActions({super.key, required this.likesCount, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // call function to toggle like here
              context.read<PostCubit>().toggleLike(postId);
            },
            child: IconWithText(icon: Icons.thumb_up_alt_outlined, count: likesCount),
          ),
          const IconWithText(icon: Icons.comment_outlined, count: 3),
          const IconWithText(icon: Icons.share_outlined, count: 5),
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
