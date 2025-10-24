import 'package:dio/dio.dart';

class GeminiRemoteDataSource {
  final Dio _dio = Dio();
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1/models';

  Future<String> fetchLatestModelName({required String apiKey}) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {'key': apiKey},
      );

      final models = List<Map<String, dynamic>>.from(response.data['models']);
      final geminiModel =
          models
              .map((model) => model['name'] as String)
              .where((name) => name.contains('gemini'))
              .toList()
            ..sort((a, b) => b.compareTo(a));

      return geminiModel.first;
    } catch (e) {
      throw Exception('Failed to fetch latest model name: $e');
    }
  }
}
