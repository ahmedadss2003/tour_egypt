import 'package:flutter/material.dart';
import 'package:login/core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onPressed, required this.txt});
  final void Function() onPressed;
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        width: double.infinity,
        
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          onPressed:onPressed ,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(txt , style: const TextStyle(color: Colors.white , fontSize: 16),),
          ) ,
        ),
      ),
    );
  }
}