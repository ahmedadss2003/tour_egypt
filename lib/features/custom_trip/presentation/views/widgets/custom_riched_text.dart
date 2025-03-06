import 'package:flutter/material.dart';
import 'package:login/core/utils/app_styles.dart';

class CustomRichedText extends StatelessWidget {
  const CustomRichedText({super.key, required this.tittle, required this.subtitle});
  final String tittle , subtitle ;
  @override
  Widget build(BuildContext context) {
    return RichText(text:  TextSpan(
      children: [
         TextSpan(
        text: '$tittle: ',
        style: AppStyles.textStyle18white,
      ),
       TextSpan(
      text: subtitle,
      style: AppStyles.textStyle18.copyWith(color: const Color.fromARGB(255, 207, 176, 176)),
  ),
      ],
    ));
  }
}