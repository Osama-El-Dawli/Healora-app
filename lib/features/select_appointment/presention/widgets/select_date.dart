import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Column(
        children: [
          Text("Mon",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primary)),
          SizedBox(height: 5,),
          Text("27",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}
