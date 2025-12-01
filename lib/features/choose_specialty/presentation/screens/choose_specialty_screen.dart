import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_specialty_grid.dart';

class ChooseSpecialtyScreen extends StatelessWidget {
  const ChooseSpecialtyScreen({super.key, required this.patient});
  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'choose_specialty'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.gray,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: ChooseSpecialtyGrid(patient: patient),
      ),
    );
  }
}
