import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class AppointmentDetailsCard extends StatelessWidget {
  const AppointmentDetailsCard({
    super.key,
    this.title,
    this.subTitle,
    this.leadingIcon,
    this.isDate = false,
    this.trailingIcon,
    this.onPressed,
  });
  final String? title, subTitle;
  final IconData? leadingIcon, trailingIcon;
  final bool isDate;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xffEAF2F7),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
        leading: leadingIcon != null
            ? Icon(size: 28.sp, leadingIcon, color: AppColors.darkGreen)
            : null,
        title: title != null
            ? Text(
                title!,
                style: isDate
                    ? Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xffA0A0A0),
                        fontWeight: FontWeight.w500,
                      )
                    : Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
              )
            : null,
        subtitle: subTitle != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  subTitle!,
                  overflow: TextOverflow.ellipsis,
                  style: isDate
                      ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        )
                      : Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA0A0A0),
                          fontWeight: FontWeight.w500,
                        ),
                ),
              )
            : null,
        trailing: trailingIcon != null
            ? IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: onPressed ?? () {},
                icon: Icon(
                  size: 24.sp,
                  trailingIcon,
                  color: AppColors.secondary,
                ),
              )
            : null,
      ),
    );
  }
}
