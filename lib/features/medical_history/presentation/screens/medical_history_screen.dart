import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_bottom_sheet.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_body.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.backgroundColor,
      body: MedicalHistoryBody(userModel: userModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (_) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BlocProvider.value(
                value: context.read<MedicalHistoryCubit>(),
                child: MedicalHistoryBottomSheet(user: userModel),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
