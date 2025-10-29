import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/chat/presentation/widgets/chat_screen_body.dart';

class DoctorChat extends StatelessWidget {
  const DoctorChat({super.key, required this.user, required this.chatId});
  final UserModel user;
  final String chatId;

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
              radius: 25.r,
              backgroundImage: AssetImage(user.imageUrl),
            ),
            SizedBox(width: 20.w),
            Text(
              user.firstName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: ChatScreenBody(user: user, chatId: chatId),
    );
  }
}
