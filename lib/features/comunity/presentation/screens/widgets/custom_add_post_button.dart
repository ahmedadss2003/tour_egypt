import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';

class CustomAddPostButton extends StatelessWidget {
  final TextEditingController textController;
  final File? selectedImage;
  const CustomAddPostButton({super.key, required this.textController, this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostSuccess) {
          Navigator.pop(context); // نغلق الـ dialog عند نجاح إضافة البوست
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Post added successfully')),
          );
        } else if (state is PostFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if( textController.text.trim().isNotEmpty){
              context.read<PostCubit>().addPost(
              text: textController.text, 
              imageFile: selectedImage,
            );
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter some text')),
              );
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 117, 117, 117),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                "Add Post",
                style: AppStyles.textStyle18.copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
