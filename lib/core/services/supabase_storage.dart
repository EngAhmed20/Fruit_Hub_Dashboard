import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:fruits_app_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class SupabaseStorage implements StorageService{
  @override
  Future<String> uploadFile(File image) async {
    final fileName = p.basename(image.path);

    // الوصول إلى الاستورج
    final bucket = Supabase.instance.client.storage.from('fruits/products');

    // رفع الصورة
     await bucket.upload(fileName, image);

      // الحصول على الرابط العام للصورة
      final publicUrl = bucket.getPublicUrl(fileName);
      return publicUrl;

  }
}