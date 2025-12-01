import 'package:healora/features/chat/data/models/message_model.dart';

class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<MessageModel> messages;

  ChatLoadedState({required this.messages});
}

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState({required this.error});
}
