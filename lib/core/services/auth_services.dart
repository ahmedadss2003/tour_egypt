import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/errors/custom_exception.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({ required String email,required String password}) async{
    try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
    return credential.user!;
  } on FirebaseAuthException catch (e) {
    log("Exception in FirebaseAuthServices.createUserWithEmailAndPassword : ${e.toString()}");

    if (e.code == 'weak-password') {
      throw CustomException(message: "كلمة المرور ضعيفة.");
    } else if (e.code == 'email-already-in-use') {
      throw CustomException(message: "البريد الالكتروني مستخدم بالفعل.");
    }else if (e.code == 'network-request-failed') {
      throw CustomException(message: "لا يوجد اتصال بالانترنت.");
      
    }
    else{
    throw CustomException(message: "لقد حصل خطأ , يرجى المحاولة مرة أخرى.");
    }
  } catch (e) {
    log("Exception in FirebaseAuthServices.createUserWithEmailAndPassword : ${e.toString()}");
    throw CustomException(message: "لقد حصل خطأ , يرجى المحاولة مرة أخرى.");
  }
    }


  Future<User> signInWithEmailAndPassword({ required String email,required String password}) async{
    try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
    return credential.user!;  
} on FirebaseAuthException catch (e) {
  log("Exception in FirebaseAuthServices.SignInWithEmailAndPassword : ${e.toString()}");
  if (e.code == 'user-not-found') {
    throw CustomException(message: "البريد الالكتروني او كلمة المرور غير صحيح. ");
  } else if (e.code == 'wrong-password') {
    throw CustomException(message: "البريد الالكتروني او كلمة المرور غير صحيح. ");
  }else if (e.code == 'network-request-failed') {
    throw CustomException(message: "لا يوجد اتصال بالانترنت.");
    
  }
  else{
  throw CustomException(message: "لقد حصل خطأ , يرجى المحاولة مرة أخرى.");
  }
} catch (e) {
  log("Exception in FirebaseAuthServices.SignInWithEmailAndPassword : ${e.toString()}");
  throw CustomException(message: "لقد حصل خطأ , يرجى المحاولة مرة أخرى.");
  }
  }
}