import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class TextForm extends StatelessWidget {
  final String hintText;
  const TextForm({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 22.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.lightGray, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.gray, width: 1.5),
        ),

        hintText: hintText,
        suffixIcon: Padding(
          padding: EdgeInsetsGeometry.directional(end: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/select.png"),
              SizedBox(width: 10),
              Image.asset("assets/images/send.png"),
            ],
          ),
        ),
      ),
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        fontSize: 15,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
