
import 'package:flutter/material.dart';
import 'package:login/features/home/presentation/views/widgets/interests_dialog.dart';

class CustomContainerMenueItem extends StatelessWidget {
    void _showInterestsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InterestsDialog();
      },
    );
  }

  const CustomContainerMenueItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
      _showInterestsDialog(context);
     } ,
      child: Container(
       width: 40,
       height: 40,
       margin: const EdgeInsets.only(right:10.0),
       decoration: const BoxDecoration(
         color: Color.fromARGB(221, 58, 58, 58),
         borderRadius: BorderRadius.all(Radius.circular(10)), 
       ),
       child: const Icon(Icons.menu)),
    );
  }
}