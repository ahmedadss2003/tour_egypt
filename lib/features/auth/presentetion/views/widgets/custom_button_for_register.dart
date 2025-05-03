
import 'package:flutter/material.dart';

class CustomButtonForRegister extends StatelessWidget {
  const CustomButtonForRegister({super.key, this.onPressed, required this.txt, required this.txtButton});
  final void Function()? onPressed ;
  final String txt ;
  final String txtButton ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(txt) ,
        TextButton(onPressed: onPressed, child: Text(txtButton , style: const TextStyle(color: Color(0xFFFD6B22)),))
      ],
    );
  }
}