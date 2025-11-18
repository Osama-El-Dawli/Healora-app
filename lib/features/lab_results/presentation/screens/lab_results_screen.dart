import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_card_body.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_card_grid.dart';

class LabResultsScreen extends StatelessWidget {
  static const String routeName = AppRoutes.labResultsScreen;

  const LabResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab Results'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.gray,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        child: LabCardBody(),
      ),
    );
  }
}
