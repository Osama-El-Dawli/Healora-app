import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_body.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_bottom_sheet.dart';

class LabResultsScreen extends StatelessWidget {
  const LabResultsScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.backgroundColor,
      body: LabResultsBody(userModel: userModel),
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
                value: context.read<LabResultsCubit>(),
                child: LabResultsBottomSheet(user: userModel),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
