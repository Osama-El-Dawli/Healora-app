import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/patients_list_view_item.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            verticalOffset: 100.0,
            curve: Curves.easeOutCubic,
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: PatientsListViewItem(
                  patient: UserModel(
                    uid: 'uid',
                    firstName: 'firstName',
                    lastName: 'lastName',
                    email: 'email',
                    phoneNumber: 'phoneNumber',
                    role: 'role',
                    specialization: 'specialization',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
