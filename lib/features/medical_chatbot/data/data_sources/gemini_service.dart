import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;

  GeminiService() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY is not set');
    }

    _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    _chatSession = _model.startChat(
      history: [
        Content.text('''
You are a professional and empathetic **medical assistant chatbot**.
Your role is to:
1. Help users describe their symptoms clearly.
2. Suggest the **most suitable medical specialty** for their case (like cardiology, neurology, internal medicine, etc.).
3. DO NOT diagnose diseases or recommend medications.
4. Keep your answers short, friendly, and professional.
5. ALWAYS reply in **the same language** that the user writes in (Arabic → reply Arabic, English → reply English).
6. If the user mixes languages, reply in the main language used.

Examples:
- If user says: "عندي ألم في الصدر وضيق تنفس" → reply in Arabic.
- If user says: "I have chest pain and shortness of breath" → reply in English.
          '''),
      ],
    );
  }

  Future<String> sendMessage({required String message}) async {
    try {
      final response = await _chatSession.sendMessage(Content.text(message));
      final reply =
          response.text?.trim() ??
          'I could not understand your symptoms, please make sure to describe them clearly.';
      return reply;
    } catch (e) {
      return 'There was an error processing your request. Please try again: ${e.toString()}.';
    }
  }

  void resetChat() {
    _chatSession = _model.startChat();
  }
}
