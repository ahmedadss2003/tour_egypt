import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/services/service_locator.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';
import 'package:login/features/comunity/presentation/screens/widgets/custom_add_post_button.dart';
import 'package:login/features/comunity/presentation/screens/widgets/custom_image_picker_container.dart';

customShowDialog(BuildContext context) {
  final TextEditingController textController = TextEditingController();
  File? selectedImage;

  return showDialog(
    barrierColor: Colors.black.withOpacity(0.2),
    barrierDismissible: true,
    context: context,
    builder: (dialogContext) {
      return BlocProvider(
        create: (context) => sl<PostCubit>(),
        child: StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Create Post"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: textController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: "Write something...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomImagePicgerContainer(
                    onImagePicked: (file) {
                      setState(() {
                        selectedImage = file; // ✅ هيتم تحديث القيمة هنا فعلاً
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Builder(
                    builder: (context) => CustomAddPostButton(
                      textController: textController,
                      selectedImage: selectedImage, // ✅ هنا بقت القيمة فعلاً مظبوطة
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
