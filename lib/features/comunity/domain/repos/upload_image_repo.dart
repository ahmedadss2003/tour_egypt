import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';

abstract class UploadImageRepo {
  Future<Either<Failure , String>> uploadImage(File image);
}