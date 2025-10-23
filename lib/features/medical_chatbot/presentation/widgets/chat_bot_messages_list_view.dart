import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/bubble_message.dart';
import 'package:healora/features/medical_chatbot/data/models/chat_bot_message_model.dart';

class ChatBotMessagesListView extends StatefulWidget {
  const ChatBotMessagesListView({
    super.key,
    required this.messages,
    this.isBotTyping = false,
  });

  final List<ChatBotMessageModel> messages;
  final bool isBotTyping;

  @override
  State<ChatBotMessagesListView> createState() =>
      _ChatBotMessagesListViewState();
}

class _ChatBotMessagesListViewState extends State<ChatBotMessagesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(ChatBotMessagesListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length ||
        widget.isBotTyping != oldWidget.isBotTyping) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    // نأخرها شوية علشان الـ ListView ترندر الأول
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(bottom: 120.h, top: 10.h),
      itemCount: widget.messages.length + (widget.isBotTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == widget.messages.length && widget.isBotTyping) {
          // Bubble typing
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h, left: 8.w, right: 8.w),
            child: const BubbleMessage(
              message: '',
              isMe: false,
              isTyping: true, // 👈 هنا بنفعل فقاعة الـ 3 نقط
            ),
          );
        }

        final message = widget.messages[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h, left: 8.w, right: 8.w),
          child: BubbleMessage(message: message.message, isMe: message.isMe),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
