import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custome_text_form_field.dart';
import 'package:healora/features/chat/presentation/widgets/text_form_field.dart';

import '../widgets/doctor_message.dart';

class DoctorChat extends StatelessWidget {
  static const String routeName = AppRoutes.chatBotScreen;
  List<DoctorMessage> messages=[
    DoctorMessage(message: "Hello chatGPT, how are you today?",index: 0,),
    DoctorMessage(message: "Hello, I'm fine, how can I help you?",index: 1,),
  DoctorMessage(message: "What is the best programming language?",index: 2,),
  DoctorMessage(message:"There are many programming languages in \nthe market that are used in designing and \nbuilding websites, various applications and \n other tasks. All these languages are popular \n in their place and in the way they are used,\n and many programmers learn and use them.",index: 3,),
    DoctorMessage(message: "So explain to me more",index: 4,),
    DoctorMessage(message:"There are many programming languages in \nthe market that are used in designing and \n building websites, various applications and \n other tasks. All these languages are popular \n in their place and in the way they are used, \n and many programmers learn and use them.",index: 5,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Icon(Icons.arrow_back, color: AppColors.primary),
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/profile.png"),
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
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(itemBuilder: (_,index)=> messages[index],
                itemCount: messages.length,)),
          Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8),
              child:TextForm(hinttext: 'write_your_message'.tr())
    )
        ],
      ),
    );
  }
}
//CustomeTextFormField(hintText: 'write_your_message'.tr(),