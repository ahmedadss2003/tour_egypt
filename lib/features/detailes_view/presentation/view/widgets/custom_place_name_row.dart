import 'package:flutter/material.dart';
import 'package:login/core/models/place_data_model.dart';

class CustomPlaceNameRow extends StatelessWidget {
  const CustomPlaceNameRow({super.key, required this.place});
  final PlaceModel place ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 250,child: Text(place.name, style: const TextStyle(overflow: TextOverflow.visible,color: Colors.black, fontSize: 25, fontFamily: "gilroy"),)),
        const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
      ]
    );
  }
}
