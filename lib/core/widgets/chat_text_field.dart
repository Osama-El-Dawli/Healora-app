import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';

class ChatTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onSend, onAttach;
  const ChatTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onSend,
    this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
              InkWell(
                splashColor: null,
                onTap: onAttach,
                child: Image.asset(Assets.imagesSelect),
              ),
              SizedBox(width: 10),
              InkWell(
                splashColor: null,
                onTap: onSend,
                child: Transform.rotate(
                  angle: (context.locale == Locale('ar')) ? 3.14 : 0,
                  child: SvgPicture.asset(
                    Assets.imagesSend,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkTextSecondary
                          : AppColors.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
