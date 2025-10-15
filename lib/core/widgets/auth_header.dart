import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_theme.dart';

// ignore: must_be_immutable
class AuthHeader extends StatelessWidget {
  String message;
  String action;

  AuthHeader({super.key, required this.message, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Text(message, style: AppTheme.lightMode.textTheme.titleMedium),
        Text(action, style: AppTheme.lightMode.textTheme.displaySmall),
        SizedBox(height: 12.h),
        Image.asset('assets/images/auth_header.png'),
        SizedBox(height: 12.h),
      ],
    );
  }
}
