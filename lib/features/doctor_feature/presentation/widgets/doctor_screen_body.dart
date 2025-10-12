import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/doctor_header.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [DoctorHeader()]),
      ),
    );
  }
}
