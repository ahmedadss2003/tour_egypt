


import 'dart:developer';


import 'package:login/core/errors/custom_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
class DatabaseAuthServices {
  Future<supabase.User> createUserWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final supabase.AuthResponse res = await supabase.Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    final supabase.User? user = res.user;
    if (user != null) {
      return user;
    } else {
      throw CustomException(message: "حدث خطأ أثناء إنشاء الحساب.");
    }

  } on supabase.AuthException catch (e) {
    if (e.message.contains('weak')) {
      throw CustomException(message: "كلمة المرور ضعيفة.");
    } else if (e.message.contains('already registered')) {
      throw CustomException(message: "البريد الإلكتروني مستخدم بالفعل.");
    } else if (e.message.contains('network') || e.message.contains('SocketException')) {
      throw CustomException(message: "لا يوجد اتصال بالإنترنت.");
    } else {
      throw CustomException(message: e.message); // رسالة مباشرة من Supabase
    }

  } catch (e) {
    log("Exception in SupabaseAuthServices.createUserWithEmailAndPassword : ${e.toString()}");
    throw CustomException(message: "لقد حصل خطأ، يرجى المحاولة مرة أخرى.");
  }
}


  Future<supabase.User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final supabase.AuthResponse response =
          await supabase.Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw CustomException(message: "فشل تسجيل الدخول. تأكد من البيانات.");
      }

      return user;
    } on supabase.AuthException catch (e) {
      log("Supabase AuthException: ${e.message}");
      throw CustomException(message: e.message);
    } catch (e) {
      log("Unknown error in signInWithEmailAndPassword: $e");
      throw CustomException(message: "لقد حصل خطأ، يرجى المحاولة مرة أخرى.");
    }
  }
}


/*
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/core/errors/custom_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
class FirebaseAuthServices {
  Future<supabase.User> createUserWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final supabase.AuthResponse res = await supabase.Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    final supabase.User? user = res.user;

    if (user != null) {
      return user;
    } else {
      throw CustomException(message: "حدث خطأ أثناء إنشاء الحساب.");
    }

  } on supabase.AuthException catch (e) {
    // التعامل مع أكواد الأخطاء الشائعة في Supabase
    if (e.message.contains('weak')) {
      throw CustomException(message: "كلمة المرور ضعيفة.");
    } else if (e.message.contains('already registered')) {
      throw CustomException(message: "البريد الإلكتروني مستخدم بالفعل.");
    } else if (e.message.contains('network') || e.message.contains('SocketException')) {
      throw CustomException(message: "لا يوجد اتصال بالإنترنت.");
    } else {
      throw CustomException(message: e.message); // رسالة مباشرة من Supabase
    }

  } catch (e) {
    log("Exception in SupabaseAuthServices.createUserWithEmailAndPassword : ${e.toString()}");
    throw CustomException(message: "لقد حصل خطأ، يرجى المحاولة مرة أخرى.");
  }
}
*/






/*
auth using firebase auth
----------
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
*/