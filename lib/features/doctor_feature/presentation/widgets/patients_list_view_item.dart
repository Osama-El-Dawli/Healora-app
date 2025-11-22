import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/helper/generate_chat_id.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class PatientsListViewItem extends StatelessWidget {
  const PatientsListViewItem({
    super.key,
    required this.patient,
    required this.appointment,
    required this.doctor,
  });
  final UserModel patient, doctor;
  final String appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xffEAF2F7),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        subtitle: Text(
          appointment,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Hero(
          tag: patient.uid,
          child: CustomProfileAvatar(
            imageUrl: patient.imageUrl,
            radius2: 22.r,
            radius1: 28.r,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.chatScreen,
              arguments: {
                'chatId': generateChatId(
                  doctorId: doctor.uid,
                  patientId: patient.uid,
                ),
                'user': patient,
              },
            );
          },
          icon: Icon(
            Icons.chat,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.primary
                : AppColors.darkGreen,
          ),
        ),
        title: Hero(
          tag: 'name${patient.uid}',
          child: Text(
            '${patient.firstName} ${patient.lastName}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
