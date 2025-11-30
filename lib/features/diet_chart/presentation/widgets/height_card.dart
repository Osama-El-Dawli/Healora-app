import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/diet_chart/constants.dart';

class HeightCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightCard({super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HEIGHT'.tr(), style: KLabelTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.toInt().toString(), style: KNumberTextStyle),
                Text('cm'.tr(), style: KLabelTextStyle),
              ],
            ),
            Slider(
              value: height,
              min: 120,
              max: 220,
              activeColor: AppColors.darkCard,
              inactiveColor: AppColors.gray,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
