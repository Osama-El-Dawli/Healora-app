import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/chat/data/models/message_model.dart';
import 'package:healora/core/widgets/bubble_message.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({
    super.key,
    required this.messages,
    required this.user,
  });

  final List<MessageModel> messages;
  final UserModel user;

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MessagesListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(bottom: 120.h, top: 10.h),
      itemCount: widget.messages.length,
      itemBuilder: (_, index) {
        final message = widget.messages[index];
        final bool isMe = message.senderId == widget.user.uid;
        final bool isSameSender =
            index > 0 &&
            widget.messages[index - 1].senderId == message.senderId;
        final double topMargin = isSameSender ? 8.h : 16.h;

        return Padding(
          padding: EdgeInsets.only(top: topMargin, left: 8.w, right: 8.w),
          child: BubbleMessage(message: message.message, isMe: isMe),
        );
      },
    );
  }
}
