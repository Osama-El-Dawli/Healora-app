import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SelectTime extends StatelessWidget {
  final String text;
  const SelectTime({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Center(
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
