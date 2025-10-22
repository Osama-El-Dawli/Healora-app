part of 'chat_bot_cubit.dart';

sealed class ChatBotState {
  final List<ChatBotMessageModel> messages;

  const ChatBotState({this.messages = const []});
}

final class ChatBotInitial extends ChatBotState {}

final class ChatBotLoading extends ChatBotState {
  const ChatBotLoading({required super.messages});
}

final class ChatBotLoaded extends ChatBotState {
  const ChatBotLoaded({required super.messages});
}

final class ChatBotError extends ChatBotState {
  final String errorMessage;
  const ChatBotError({required this.errorMessage, required super.messages});
}
