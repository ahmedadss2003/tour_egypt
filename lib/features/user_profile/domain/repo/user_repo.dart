import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';

abstract class UserRepo {
  Future<Either<Failure , String>> uploadUserProfileImage(File image);
  
}