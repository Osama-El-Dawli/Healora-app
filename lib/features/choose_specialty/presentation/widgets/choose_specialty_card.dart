import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/choose_specialty/data/models/choose_spacialty_model.dart';

import '../../../../core/theme/app_colors.dart';

class ChooseSpecialtyCard extends StatelessWidget {
  const ChooseSpecialtyCard({super.key, required this.choose});
  final ChooseSpacialityModel choose;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(12.w),

      child: Container
        (decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SizedBox(
                width: 80.w,
                height: 80.h,
                child: Image.asset(choose.image,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {

                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, size: 40),
                    );
                  },),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Center(
                child: Text(

                  choose.spacialityName,
                  style: textTheme.titleSmall?.copyWith(color: AppColors.primary),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
