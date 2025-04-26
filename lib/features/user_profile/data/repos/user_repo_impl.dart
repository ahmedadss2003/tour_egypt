import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/constant.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/features/user_profile/domain/repo/user_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepoImpl extends UserRepo{
  final SupabaseClient supabaseClient ;

  UserRepoImpl({required this.supabaseClient});

  @override
  Future<Either<Failure, String>> uploadUserProfileImage(File image)async {
    try {
    final fileName = "${DateTime.now().microsecondsSinceEpoch}_${image.path.split('/').last}";
    final repsonse =await supabaseClient.storage.from(kUserProfileBacketName).upload("images/$fileName" ,image);
    print("Upload response: $repsonse");
    final publicUrl = supabaseClient.storage.from(kUserProfileBacketName).getPublicUrl("images/$fileName");
    print("Image uploaded to: $publicUrl");
    return Right(publicUrl);
  } catch (e) {
    return Left(ServerFailure(message: 'فشل رفع الصورة: ${e.toString()}'));
  }
    
  }
}