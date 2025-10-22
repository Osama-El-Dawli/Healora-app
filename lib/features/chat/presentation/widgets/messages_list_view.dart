import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/chat/data/models/message_model.dart';
import 'package:healora/core/widgets/bubble_message.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.messages,
    required this.user,
  });
  final List<MessageModel> messages;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 120.h),
      itemBuilder: (_, index) => BubbleMessage(
        message: messages[index].message,
        isMe: messages[index].senderId == user.uid,
      ),
      itemCount: messages.length,
    );
  }
}
