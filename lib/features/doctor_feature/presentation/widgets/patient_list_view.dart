import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/patients_list_view_item.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {},
                  child: PatientsListViewItem(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
