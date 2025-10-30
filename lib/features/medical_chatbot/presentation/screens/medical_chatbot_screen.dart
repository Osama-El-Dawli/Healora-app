import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/medical_chatbot/presentation/widgets/chat_bot_body.dart';

class MedicalChatbotScreen extends StatelessWidget {
  static const String routeName = AppRoutes.chatBotScreen;

  const MedicalChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.lightGray,
              radius: 20.r,
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(Assets.imagesChatBot),
              ),
            ),
            SizedBox(width: 20.w),
            Text('ChatBot'.tr(), style: textTheme.titleLarge),
          ],
        ),
      ),
      body: ChatBotBody(),
    );
  }
}
