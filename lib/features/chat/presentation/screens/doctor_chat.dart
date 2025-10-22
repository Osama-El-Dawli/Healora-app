import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/chat/presentation/widgets/chat_screen_body.dart';

class DoctorChat extends StatelessWidget {
  const DoctorChat({
    super.key,
    required this.currentUserId,
    required this.chatId,
  });
  final String currentUserId;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primary,
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Assets.imagesAvatar),
            ),
            SizedBox(width: 10),
            Text(
              "Name",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: ChatScreenBody(currentUserId: currentUserId),
    );
  }
}
