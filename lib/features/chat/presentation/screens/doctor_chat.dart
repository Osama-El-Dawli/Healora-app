import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/chat/presentation/widgets/text_form_field.dart';
import '../widgets/doctor_message.dart';

class DoctorChat extends StatelessWidget {
  static const String routeName = AppRoutes.chatBotScreen;

  final List<DoctorMessage> messages = [
    DoctorMessage(message: "Hello chatGPT, how are you today?", index: 0),
    DoctorMessage(message: "Hello, I'm fine, how can I help you?", index: 1),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(message: "What is the best programming language?", index: 2),
    DoctorMessage(
      message:
          "There are many programming languages in \nthe market that are used in designing and \nbuilding websites, various applications and \n other tasks. All these languages are popular \n in their place and in the way they are used,\n and many programmers learn and use them.",
      index: 3,
    ),
    DoctorMessage(message: "So explain to me more", index: 4),
    DoctorMessage(
      message:
          "There are many programming languages in \nthe market that are used in designing and \n building websites, various applications and \n other tasks. All these languages are popular \n in their place and in the way they are used, \n and many programmers learn and use them.",
      index: 5,
    ),
  ];

  DoctorChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Icon(Icons.arrow_back, color: AppColors.primary),
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
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 120.h),
            itemBuilder: (_, index) => messages[index],
            itemCount: messages.length,
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
              child: TextForm(hintText: 'write_your_message'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
