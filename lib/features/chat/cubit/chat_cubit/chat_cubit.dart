import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_state.dart';
import 'package:healora/features/chat/data/models/message_model.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(ChatInitialState());

  void loadMessages({required String chatId}) {
    emit(ChatLoadingState());
    _chatRepo
        .getMessages(chatId)
        .listen(
          (messages) {
            emit(ChatLoadedState(messages: messages));
          },
          onError: (error) {
            emit(ChatErrorState(error: error.toString()));
          },
        );
  }

  Future<void> sendMessage({
    required String chatId,
    required String message,
    required String senderId,
  }) async {
    if (message.trim().isEmpty) return;
    final MessageModel newMessage = MessageModel(
      id: '',
      message: message,
      senderId: senderId,
      timestamp: DateTime.now(),
    );

    await _chatRepo.sendMessage(chatId, newMessage);
  }
}
