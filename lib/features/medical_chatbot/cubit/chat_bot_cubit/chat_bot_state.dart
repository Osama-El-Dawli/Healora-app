part of 'chat_bot_cubit.dart';

sealed class ChatBotState {
  final List<ChatBotMessageModel> messages;
  final bool isTyping;

  const ChatBotState({this.isTyping = false, this.messages = const []});
}

final class ChatBotInitial extends ChatBotState {}

final class ChatBotLoading extends ChatBotState {
  const ChatBotLoading({required super.messages});
}

class ChatBotLoaded extends ChatBotState {
  const ChatBotLoaded({required super.messages, bool isBotTyping = false})
    : super(isTyping: isBotTyping);
}

final class ChatBotError extends ChatBotState {
  final String errorMessage;
  const ChatBotError({required this.errorMessage, required super.messages});
}
