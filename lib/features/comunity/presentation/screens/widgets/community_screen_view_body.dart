import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/comunity/presentation/screens/widgets/bottom_sheet.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_card.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_input_card.dart';


class CommunityScreenViewBody extends StatelessWidget {
  const CommunityScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Community')),
        automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          PostInputCard(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const CreatePostBottomSheet(),
            );
          },
        ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}



