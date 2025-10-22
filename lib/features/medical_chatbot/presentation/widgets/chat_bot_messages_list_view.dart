import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/bubble_message.dart';

class ChatBotMessagesListView extends StatelessWidget {
  const ChatBotMessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 120.h, top: 10.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h, left: 8.w, right: 8.w),
          child: BubbleMessage(message: 'hello', isMe: true),
        );
      },
      itemCount: 10,
    );
  }
}
