import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/edit_medical_history_card.dart';

import '../../data/data_sources/medical_history_firebase_data_source.dart';

class MedicalHistoryCard extends StatefulWidget {
  const MedicalHistoryCard({super.key, required this.model});
  final MedicalHistoryModel model;

  @override
  State<MedicalHistoryCard> createState() => _MedicalHistoryCardState();
}

class _MedicalHistoryCardState extends State<MedicalHistoryCard> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () async {
        final updatedModel = await Navigator.of(context).pushNamed(
          AppRoutes.EditMedicalHistoryCard,
          arguments: widget.model,
        );

        if (updatedModel != null && updatedModel is MedicalHistoryModel) {
          await MedicalHistoryFirebaseDataSource().updateMedicalHistory(
            docId: updatedModel.id!,
            model: updatedModel,
          );

          setState(() {
            widget.model.title = updatedModel.title;
            widget.model.description = updatedModel.description;
          });
        }

      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8.r,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.hintColor.withValues(alpha: 0.6)
                  : Colors.black.withValues(alpha: 0.16),
              spreadRadius: 0,
            ),
          ],
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.lightGray
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.model.title,
              style: textTheme.titleSmall?.copyWith(color: AppColors.primary),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            Text(
              widget.model.description,
              style: textTheme.labelLarge?.copyWith(color: AppColors.hintColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
