import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/features/comunity/domain/repos/post_repo.dart';
import 'package:login/features/comunity/domain/repos/upload_image_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostRepoImpl extends PostRepo{
  SupabaseClient supabaseClient;
  UploadImageRepo uploadImageRepo ; 
  PostRepoImpl({required this.supabaseClient , required this.uploadImageRepo});
  
  @override
  Future<Either<Failure, void>> addPost({required String text, File? imageFile}) async{
    try{
      String? imageUrl ; 
      if(imageFile != null){
        final uploadResult = await uploadImageRepo.uploadImage(imageFile);
        
        return uploadResult.fold(
          (l) => left(l),
          (url)async{
            imageUrl = url;
            final insertResult = await _insertPost(
              text: text,
              imageUrl: imageUrl,
            );
            return insertResult ;
          },
          
        );
      }
      else{
        final insertResult = await _insertPost(
          text: text,
          imageUrl: imageUrl,
        );
        return insertResult ;
      }
    }catch(e){
      return  Left(ServerFailure(message: e.toString()));
    }
    
  }

  Future<Either<Failure, void>> _insertPost({required String text, String? imageUrl}) async{
    try{
      await supabaseClient.from('Posts').insert({
        'uid': supabaseClient.auth.currentUser!.id,
        'content': text,
        'image_url': imageUrl,
        'created_at': DateTime.now().toIso8601String(),
      });
      return right(null);
    }catch(e){
      return Left(ServerFailure(message: " Failure in add Post: ${e.toString()}"));    }
  }
  
 @override
Future<Either<Failure, List<Map<String, dynamic>>>> getAllPosts() async {
  try {
    final response = await supabaseClient
        .from('Posts')
        .select('*, User(name) , postlikes(count)')
        .order('created_at', ascending: false);

    return right(response);
  } catch (e) {
    return left(ServerFailure(message: e.toString()));
  }
}

@override
Future<Either<Failure, List<Map<String, dynamic>>>> getMyPosts() async {
  try {
    final userId = supabaseClient.auth.currentUser!.id;
    final response = await supabaseClient
        .from('Posts')
        .select('*, User(name)') 
        .eq('uid', userId)
        .order('created_at', ascending: false);
    return right(response);
  } catch (e) {
    return left(ServerFailure(message: e.toString()));
  }
}

Future<void> toggleLike(int postId) async {
  final userId = supabaseClient.auth.currentUser!.id;

  final existingLike = await supabaseClient
      .from('postlikes')
      .select()
      .eq('user_id', userId)
      .eq('post_id', postId)
      .maybeSingle();

  if (existingLike != null) {
    await supabaseClient
        .from('postlikes')
        .delete()
        .eq('user_id', userId)
        .eq('post_id', postId);
  } else {
    await supabaseClient.from('postlikes').insert({
      'user_id': userId,
      'post_id': postId,
      'created_at': DateTime.now().toIso8601String(),
    });
  }
}


  
}