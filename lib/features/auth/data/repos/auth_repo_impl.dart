import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/core/services/auth_services.dart';
import 'package:login/features/auth/domain/entity/user_entity.dart';
import 'package:login/features/auth/domain/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo{
  final DatabaseAuthServices firebaseAuthServices ;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
  String email,
  String password,
  String name,
) async {
  try {
    final sb.AuthResponse res = await sb.Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      
    );

    final sb.User? user = res.user;

    if (user == null) {
      return Left(ServerFailure(message: "فشل في إنشاء الحساب. يرجى المحاولة مرة أخرى."));
    }

    await sb.Supabase.instance.client.from('User').insert({
      'id': user.id,
      'email': email,
      'name': name,
      'created_at': DateTime.now().toIso8601String(),
    });

    final userEntity = UserEntity(
      name: name,
      email: email,
      uId: user.id,
    );

    return Right(userEntity);
  } on sb.AuthException catch (e) {
    return Left(ServerFailure(message: e.message));
  } catch (e) {
    log("Exception in AuthRepoImplementation.createUserWithEmailAndPassword : ${e.toString()}");
    return Left(ServerFailure(message: "لقد حدث خطأ ما، يرجى المحاولة مرة أخرى."));
  }
}
    
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
  try {
    final sb.AuthResponse res = await sb.Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final sb.User? user = res.user;

    if (user == null) {
      return Left(ServerFailure(message: "فشل تسجيل الدخول، يرجى المحاولة مرة أخرى."));
    }

    UserEntity userEntity = UserEntity(
      name: '', // You can fetch the actual name later from your User table if needed
      email: user.email ?? '',
      uId: user.id,
    );

    return Right(userEntity);

  } on AuthException catch (e) {
    return Left(ServerFailure(message: e.message));
  } catch (e) {
    log("Exception in AuthRepoImplementation.signInWithEmailAndPassword : ${e.toString()}");
    return Left(ServerFailure(message: "لقد حصل خطأ يرجى المحاولة مرة أخرى"));
  }
}

}





/*
auth using firebase 
--------
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/core/services/auth_services.dart';
import 'package:login/features/auth/domain/entity/user_entity.dart';
import 'package:login/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final FirebaseAuthServices firebaseAuthServices ;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure ,UserEntity>> createUserWithEmailAndPassword(String email, String password, String name)async {
  User? user ;     
     try {
      user =  await firebaseAuthServices.createUserWithEmailAndPassword(email: email, password: password);
      UserEntity userEntity = UserEntity(name:name, email: email, uId: user.uid);
      return Right(userEntity);
    }on Exception catch(e){
      return Left(ServerFailure(message: e.toString()));
    }catch (e){
      log("Exception in AuthRepoImplementation.createUserWithEmailAndPassword : ${e.toString()}");
      return Left(ServerFailure(message: " لقد حدث خطا ما يرجى المحاولة مرة اخرى" ));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
  User? user;
  try {
    user = await firebaseAuthServices.signInWithEmailAndPassword(email: email, password: password);
    UserEntity userEntity = UserEntity(name: '', email: email, uId: user.uid);
    return Right(userEntity);
  } on Exception catch (e) {
    return Left(ServerFailure(message: e.toString()));
  } catch (e) {
    log("Exception in AuthRepoImplementation.signInWithEmailAndPassword : ${e.toString()}");
    return Left(ServerFailure(message: "لقد حصل خطأ يرجى المحاولة مرة أخرى"));
  }
}

}
*/