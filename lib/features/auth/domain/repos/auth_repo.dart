

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure ,UserEntity>> createUserWithEmailAndPassword(String email, String password , String name);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password);
}