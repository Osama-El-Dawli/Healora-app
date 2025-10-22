import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/chat_text_field.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_cubit.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_state.dart';
import 'package:healora/features/chat/presentation/widgets/messages_list_view.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key, required this.currentUserId});
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Stack(
          children: [
            state is ChatLoadedState
                ? MessagesListView(
                    messages: state.messages,
                    currentUserId: currentUserId,
                  )
                : Center(child: CircularProgressIndicator()),
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
                child: ChatTextField(hintText: 'write_your_message'.tr()),
              ),
            ),
          ],
        );
      },
    );
  }
}
