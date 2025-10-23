import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/chat_text_field.dart';
import 'package:healora/features/medical_chatbot/cubit/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:healora/features/medical_chatbot/presentation/widgets/chat_bot_messages_list_view.dart';

class ChatBotBody extends StatefulWidget {
  const ChatBotBody({super.key});

  @override
  State<ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<ChatBotBody> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBotCubit, ChatBotState>(
      builder: (context, state) {
        return Stack(
          children: [
            ChatBotMessagesListView(
              messages: state.messages,
              isBotTyping: state.isTyping,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 140.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.0),
                      Colors.white.withValues(alpha: 0.8),
                      Colors.white,
                      Colors.white.withValues(alpha: 0.8),
                      Colors.white.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 44.h,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.13),
                      blurRadius: 20,
                      offset: const Offset(5, 4),
                    ),
                  ],
                ),
                child: ChatTextField(
                  hintText: 'write_your_message'.tr(),
                  controller: _controller,
                  onSend: () {
                    if (_controller.text.trim().isNotEmpty) {
                      context.read<ChatBotCubit>().sendMessage(
                        message: _controller.text.trim(),
                      );
                    }
                    _controller.clear();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
