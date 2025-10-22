import 'package:bloc/bloc.dart';
import 'package:healora/features/medical_chatbot/data/models/chat_bot_message_model.dart';
import 'package:healora/features/medical_chatbot/data/repositories/chat_bot_repo.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit(this._chatBotRepo) : super(ChatBotInitial());
  final ChatBotRepo _chatBotRepo;

  Future<void> sendMessage({required String message}) async {
    if (message.isEmpty) return;
    final currentMessages = List<ChatBotMessageModel>.from(state.messages)
      ..add(ChatBotMessageModel(message: message, isMe: true));

    emit(ChatBotLoaded(messages: currentMessages));

    try {
      final reply = await _chatBotRepo.sendMessage(message: message);
      currentMessages.add(ChatBotMessageModel(message: reply, isMe: false));
      emit(ChatBotLoaded(messages: currentMessages));
    } catch (e) {
      emit(
        ChatBotError(
          messages: currentMessages,
          errorMessage: 'There was an error: $e',
        ),
      );
    }
  }

  void resetChat() {
    _chatBotRepo.resetChat();
    emit(ChatBotInitial());
  }
}
