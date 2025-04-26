import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:login/constant.dart';
import 'package:login/core/errors/failures.dart';
import 'package:login/features/comunity/domain/repos/upload_image_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadImageRepoImpl extends UploadImageRepo{
  final SupabaseClient supabaseClient ;

  UploadImageRepoImpl({required this.supabaseClient});

  @override

  Future<Either<Failure , String>> uploadImage(File image)async {
    try {
  final fileName = "${DateTime.now().microsecondsSinceEpoch}_${image.path.split('/').last}";
  final repsonse =await supabaseClient.storage.from(kPostBacketName).upload("private/$fileName" ,image);
  print("Upload response: $repsonse");
  final publicUrl = supabaseClient.storage.from(kPostBacketName).getPublicUrl("private/$fileName");
  print("Image uploaded to: $publicUrl");
  return Right(publicUrl);
} catch (e) {
  return Left(ServerFailure(message: 'فشل رفع الصورة: ${e.toString()}'));
}
    

  }
  
  

}