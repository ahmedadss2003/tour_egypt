
import 'package:flutter/material.dart';

class CustomContainerMenueItem extends StatelessWidget {
    final void Function()? onTap ;

  const CustomContainerMenueItem({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap ,
      child: Container(
       width: 40,
       height: 40,
       margin: const EdgeInsets.only(right:10.0),
       decoration: const BoxDecoration(
         color: Color.fromARGB(255, 117, 117, 117),
         borderRadius: BorderRadius.all(Radius.circular(10)), 
       ),
       child: const Icon(Icons.menu)),
    );
  }
}