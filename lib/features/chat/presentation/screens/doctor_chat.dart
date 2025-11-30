import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/chat/presentation/widgets/chat_screen_body.dart';

class DoctorChat extends StatelessWidget {
  const DoctorChat({
    super.key,
    required this.otherUser,
    required this.chatId,
    required this.currentUser,
  });
  final UserModel otherUser;
  final String chatId;
  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: otherUser.imageUrl.startsWith('http')
                  ? NetworkImage(otherUser.imageUrl)
                  : AssetImage(Assets.imagesAvatar),
            ),
            SizedBox(width: 16.w),
            Text(
              otherUser.firstName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: ChatScreenBody(
        otherUser: otherUser,
        chatId: chatId,
        currentUser: currentUser,
      ),
    );
  }
}
