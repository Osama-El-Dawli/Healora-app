import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/medical_history/presentation/widgets/bottom_body.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_body.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.backgroundColor,
      body: MedicalHistoryBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => const BottomSheetBody(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
