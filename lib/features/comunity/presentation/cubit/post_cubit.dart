  import 'dart:io';

  import 'package:bloc/bloc.dart';
  import 'package:equatable/equatable.dart';
  import 'package:login/features/comunity/domain/repos/post_repo.dart';

  part 'post_state.dart'; 
  class PostCubit extends Cubit<PostState> {
    final PostRepo postRepo;
    PostCubit({required this.postRepo}) : super(PostInitial());

    Future<void> addPost({required String text, File? imageFile}) async {
      emit(PostLoading());
      final result = await postRepo.addPost(text: text, imageFile: imageFile);
      result.fold(
        (failure) => emit(PostFailure(message: failure.message)),
        (_) {
          emit(const  PostSuccess(isPostAdded: true));
        },
      );
    }

    Future<void> fetchAllPosts() async {
      emit(PostLoading());
      try {
        final result = await postRepo.getAllPosts(                                                                        );
        result.fold(
          (failure) => emit(PostFailure(message: failure.message)),
          (posts) => emit(PostSuccess(posts: posts)),
        );
      } catch (e) {
        emit(PostFailure(message: e.toString()));
      }
    }

    Future<void> fetchMyPosts() async {
      emit(PostLoading());
      try {
        final result = await postRepo.getMyPosts();
        result.fold(
          (failure) => emit(PostFailure(message: failure.message)),
          (posts) => emit(PostSuccess(posts: posts)),
        );
      } catch (e) {
        emit(PostFailure(message: e.toString()));
      }
    }
    Future<void> toggleLike(int postId) async {
  try {
    await postRepo.toggleLike(postId);
    // بعد التفاعل مع اللايك، يفضل تحديث البيانات لو تحب ترجع الريلود
    await fetchAllPosts(); // لو انت بتعرض كل البوستات
  } catch (e) {
    emit(PostFailure(message: e.toString()));
  }
}

  }