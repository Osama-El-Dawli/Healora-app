import 'package:healora/features/medical_chatbot/data/data_sources/gemini_service.dart';

class ChatBotRepo {
  final GeminiService _geminiService;

  ChatBotRepo({required GeminiService geminiService})
    : _geminiService = geminiService;

  Future<void> initialize() => _geminiService.initialize();

  Future<String> sendMessage({required String message}) =>
      _geminiService.sendMessage(message: message);

  void resetChat() => _geminiService.resetChat();
}
