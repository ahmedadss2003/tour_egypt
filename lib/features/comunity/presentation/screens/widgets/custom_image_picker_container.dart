import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicgerContainer extends StatefulWidget {
  final Function(File) onImagePicked;
  const CustomImagePicgerContainer({super.key, required this.onImagePicked});
  @override
  State<CustomImagePicgerContainer> createState() => _CustomImagePicgerContainerState();
}

class _CustomImagePicgerContainerState extends State<CustomImagePicgerContainer> {
  final ImagePicker picker = ImagePicker();
  XFile ? imageFile ;

  Future<void> pickImage()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    final File file = File(image!.path);
    widget.onImagePicked(file);
    setState(() {
      imageFile = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        width: 150,
        height: 150,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 59, 100, 53),
          image: imageFile !=null ?
          DecorationImage(
            image: FileImage(File(imageFile!.path)),
            fit: BoxFit.cover,
          ):null
        ),
        child:imageFile !=null ? null :  const Icon(
            Icons.camera_alt,
              color: Colors.white,
              size: 75, // Adjust size for smaller dimensions
        ),
      ),
    );
  }
}