
import 'package:flutter/material.dart';
import 'package:login/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.txt});
  final void Function()?onPressed ;
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration:const BoxDecoration(
      color: AppColors.kPurpleColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: onPressed,
         child: Text(
          txt,
          style: const TextStyle(fontSize: 24),
          ),
         ),
    );
  }
}