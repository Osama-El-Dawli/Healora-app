import 'dart:io';

import 'package:healora/core/constants/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUploadProfileImageRemoteDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<String> uploadProfileImage({
    required File imageFile,
    required String fileName,
  }) async {
    try {
      await _supabase.storage
          .from(AppConstants.usersProfileImages)
          .upload(fileName, imageFile);

      final publicUrl = _supabase.storage
          .from(AppConstants.usersProfileImages)
          .getPublicUrl(fileName);

      return publicUrl;
    } on StorageException catch (e) {
      throw Exception('Failed to upload profile image: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
