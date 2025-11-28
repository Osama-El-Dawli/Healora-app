import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class LabResultsSupabaseStorageDataSource {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String> uploadFile(File file, String path, String bucketName) async {
    try {
      final fileName = DateTime.now().toIso8601String().replaceAll(':', '-');

      try {
        await _client.storage
            .from(bucketName)
            .upload(
              fileName,
              file,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );
      } on StorageException catch (e) {
        if (e.statusCode == '404' || e.message.contains('Bucket not found')) {
          try {
            await _client.storage.createBucket(
              bucketName,
              const BucketOptions(public: true),
            );
            await _client.storage
                .from(bucketName)
                .upload(
                  fileName,
                  file,
                  fileOptions: const FileOptions(
                    cacheControl: '3600',
                    upsert: false,
                  ),
                );
          } catch (createError) {
            throw Exception(
              'Bucket "$bucketName" not found and could not be created. Please create it in Supabase dashboard.',
            );
          }
        } else {
          rethrow;
        }
      }

      final String publicUrl = _client.storage
          .from(bucketName)
          .getPublicUrl(fileName);
      return publicUrl;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to upload image: $e');
    }
  }
}
