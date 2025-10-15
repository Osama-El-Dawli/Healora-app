import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';

class DoctorChat extends StatelessWidget {
  static const String routeName = AppRoutes.chatBotScreen;

  const DoctorChat({super.key});

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "Hello chatGPT, how are you today?",
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Text(
                              "Hello, I'm fine, how can I help you?",
                              style: Theme.of(context).textTheme.displaySmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "What is the best programming language?",
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Text(
                              "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
                              style: Theme.of(context).textTheme.displaySmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "So explain to me more",
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Text(
                              "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
                              style: Theme.of(context).textTheme.displaySmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              //color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.gray),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'write_your_message'.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 15,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Image.asset("assets/images/select.png", height: 20),
                SizedBox(width: 10),
                Image.asset("assets/images/send.png", height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
