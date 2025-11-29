import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/helper/generate_chat_id.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';
import 'package:healora/core/widgets/custom_info_card.dart';

class SelectDoctorListView extends StatelessWidget {
  const SelectDoctorListView({
    super.key,
    required this.doctors,
    required this.patient,
  });
  final List<DoctorModel> doctors;
  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, index) => SizedBox(height: 12.h),
      itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          verticalOffset: 100.0,
          curve: Curves.easeOutCubic,
          child: FadeInAnimation(
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.selectAppointmentScreen,
                  arguments: {
                    'doctorModel': doctors[index],
                    'patientModel': patient,
                  },
                );
              },
              child: Hero(
                tag: doctors[index].uid,
                child: CustomInfoCard(
                  title: doctors[index].firstName,
                  image: doctors[index].imageUrl,
                  subTitle: doctors[index].specialization.tr(),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.chatScreen,
                        arguments: {
                          'chatId': generateChatId(
                            doctorId: doctors[index].uid,
                            patientId: patient.uid,
                          ),
                          'otherUser': doctors[index],
                          'currentUser': patient,
                        },
                      );
                    },
                    icon: Icon(
                      Icons.chat,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.primary
                          : AppColors.darkGreen,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      itemCount: doctors.length,
    );
  }
}
