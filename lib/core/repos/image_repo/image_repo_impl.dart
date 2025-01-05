import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;
import 'package:fruits_app_dashboard/core/errors/failure.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String imageUrl = await storageService.uploadFile(image);
      print(imageUrl);
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
/*
  Future<Either<Failure, String>> uploadImage(File image) async{
    try {
      // الحصول على اسم الملف
      final fileName =p.basename(image.path);

      // الوصول إلى الاستورج
      final bucket = Supabase.instance.client.storage.from('fruits/products');

      // رفع الصورة
      final response = await bucket.upload(fileName, image);

      if (response.isEmpty == false) {
        // الحصول على الرابط العام للصورة
        final publicUrl = bucket.getPublicUrl(fileName);
        return Right(publicUrl);
      } else {
        // إذا كان هناك خطأ أثناء الرفع
        return Left(ServerFailure(AppString.otherException));
      }
    } catch (e) {
      // إذا حدث استثناء غير متوقع
      return Left(ServerFailure(e.toString()));
    }
  }
 */