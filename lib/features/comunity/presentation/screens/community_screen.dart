import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/services/service_locator.dart';
import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';
import 'package:login/features/comunity/presentation/screens/widgets/community_screen_view_body.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>(),
      child: const CommunityScreenViewBody(),
    );
  }
}
