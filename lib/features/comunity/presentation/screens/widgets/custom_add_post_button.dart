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
      if (state is PostSuccess && state.isPostAdded) {
        Navigator.pop(context);
        
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
      final isLoading = state is PostLoading;
      
      return GestureDetector(
        onTap: isLoading 
          ? null 
          : () {
              if(textController.text.trim().isNotEmpty) {
                context.read<PostCubit>().addPost(
                  text: textController.text,
                  imageFile: selectedImage,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter some text')),
                );
              }
            },
        child: Container(
          decoration: BoxDecoration(
            color: isLoading 
                ? Colors.grey 
                : const Color.fromARGB(255, 117, 117, 117),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
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