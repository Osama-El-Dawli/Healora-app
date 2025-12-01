import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_state.dart';
import 'package:healora/features/chat/data/models/message_model.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';
import 'package:healora/core/notifications/send_notification_service.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  StreamSubscription<List<MessageModel>>? _messagesSubscription;

  ChatCubit(this._chatRepo) : super(ChatInitialState());

  void loadMessages({required String chatId}) {
    emit(ChatLoadingState());

    _messagesSubscription?.cancel();

    _messagesSubscription = _chatRepo
        .getMessages(chatId)
        .listen(
          (messages) {
            if (!isClosed) {
              emit(ChatLoadedState(messages: messages));
            }
          },
          onError: (error) {
            if (!isClosed) {
              emit(ChatErrorState(error: error.toString()));
            }
          },
        );
  }

  Future<void> sendMessage({
    required String chatId,
    required String message,
    required String senderId,
    required String recipientId,
    required String senderName,
    required String senderImage,
  }) async {
    if (message.trim().isEmpty) return;
    final newMessage = MessageModel(
      id: '',
      message: message,
      senderId: senderId,
      timestamp: DateTime.now(),
    );
    await _chatRepo.sendMessage(chatId, newMessage);

    final token = await _chatRepo.getFcmToken(recipientId);
    if (token != null) {
      await sendNotification(
        token: token,
        title: senderName,
        body: message,
        data: {
          'type': 'chat',
          'chatId': chatId,
          'senderId': senderId,
          'senderName': senderName,
          'senderImage': senderImage,
        },
      );
    }
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
