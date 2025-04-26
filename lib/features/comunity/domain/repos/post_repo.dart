import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';

abstract class PostRepo {
  Future<Either<Failure, void>> addPost({
    required String text,
    File? imageFile,
  });
  Future<Either<Failure , List<Map<String , dynamic>>>> getAllPosts();
  Future<Either<Failure , List<Map<String , dynamic>>>> getMyPosts();
  Future<void> toggleLike(int postId) ;

  
}