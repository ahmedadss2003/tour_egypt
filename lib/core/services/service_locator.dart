import 'package:get_it/get_it.dart';
import 'package:login/features/comunity/data/repo/post_repo_impl.dart';
import 'package:login/features/comunity/data/repo/upload_image_repo_impl.dart';
import 'package:login/features/comunity/domain/repos/post_repo.dart';
import 'package:login/features/comunity/domain/repos/upload_image_repo.dart';

import 'package:login/features/comunity/presentation/cubit/post_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  sl.registerLazySingleton<UploadImageRepo>(() => UploadImageRepoImpl(
        supabaseClient: sl<SupabaseClient>(),
      ));

  sl.registerLazySingleton<PostRepo>(() => PostRepoImpl(
        supabaseClient: sl<SupabaseClient>(),
        uploadImageRepo: sl<UploadImageRepo>(),
      ));

  sl.registerFactory<PostCubit>(() => PostCubit(postRepo: sl<PostRepo>()));
}
