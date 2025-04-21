import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/services/service_locator.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';
import 'package:login/features/comunity/presentation/screens/widgets/show_dialog.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_card.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_input_card.dart';

class CommunityScreenViewBody extends StatelessWidget {
  const CommunityScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>()..fetchPosts(),
      child: Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('Community')),
            automaticallyImplyLeading: false),
        body: Column(
          children: [
            PostInputCard(
              onTap: () {
                customShowDialog(context);
              },
            ),
            Expanded(
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const Center(child: const CircularProgressIndicator(),);
                  }
                  else if (state is PostSuccess) {
                    return ListView.builder(
                    itemCount: state.posts!.length,
                    itemBuilder: (context, index) {
                      final post = state.posts![index];
                      print("post.length: ${state.posts!.length}");
                      return PostCard(
                        text: post['content'],
                        imageUrl: post['image_url'],
                      );
                    },
                  );
                  }
                  else if(state is PostFailure){
                    return Center(child: Text('Error: ${state.message}'));
                  }else{
                    return const SizedBox();
                  }
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
