import 'dart:io';

import 'package:healora/features/edit_account/data/data_sources/supabase_upload_profile_image_remote_data_source.dart';

class UploadProfileImageRepo {
  final SupabaseUploadProfileImageRemoteDataSource _dataSource;

  UploadProfileImageRepo({
    required SupabaseUploadProfileImageRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<String> uploadProfileImage({
    required File imageFile,
    required String fileName,
  }) async {
    return await _dataSource.uploadProfileImage(
      imageFile: imageFile,
      fileName: fileName,
    );
  }
}
