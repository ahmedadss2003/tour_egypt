import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/services/service_locator.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';
import 'package:login/features/comunity/presentation/screens/widgets/custom_image_picker_container.dart';
import 'package:login/features/comunity/presentation/screens/widgets/post_card.dart';
import 'package:login/features/user_profile/presentation/screens/user_profile.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>()..fetchMyPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Community')),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UserProfile.routeName);
              },
              icon: const Icon(Icons.person),
            )
          ],
        ),
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            String userName = "User Name"; 
            if (state is PostSuccess && state.posts != null && state.posts!.isNotEmpty) {
              userName = state.posts![0]['User']?['name'] ?? 'Unknown';
            }

            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImagePicgerContainer(
                          onImagePicked: (ima) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(userName, style: AppStyles.textStyle22.copyWith(fontWeight: FontWeight.w400),),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                // Posts content
                if (state is PostSuccess) ...[
                  if (state.posts == null || state.posts!.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'No posts available',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final post = state.posts![index];
                          return PostCard(
                            likesCount:post['postlikes'][0]['count'] ,
                            postId:post['id'] ,
                            name: post['User']?['name'] ?? 'Unknown',
                            text: post['content'],
                            imageUrl: post['image_url'],
                          );
                        },
                        childCount: state.posts!.length,
                      ),
                    ),
                ] else if (state is PostFailure)
                  SliverFillRemaining(
                    child: Center(child: Text('Error: ${state.message}')),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}