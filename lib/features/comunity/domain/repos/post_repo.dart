import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> addPost({
    required String text,
    File? imageFile,
  });
}