import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostBottomSheet extends StatelessWidget {
  const CreatePostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Write something...",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                },
                icon: const Icon(Icons.photo,color: Colors.green,),
                label: const Text("Add Photo", style: TextStyle(color: Colors.green),),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text("Post",style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}