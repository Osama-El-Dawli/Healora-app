import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_bottom_sheet.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_body.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicalHistoryCubit, MedicalHistoryState>(
      listener: (context, state) {
        if (state is MedicalHistoryAdded) {
          Navigator.pop(context);

          context.read<MedicalHistoryCubit>().getMedicalHistoryList(
            uid: userModel.uid,
          );

          Fluttertoast.showToast(
            msg: 'added_successfully'.tr(),
            backgroundColor: AppColors.secondary,
            textColor: Colors.white,
          );
        } else if (state is MedicalHistoryFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
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
                  child: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                    builder: (_, state) {
                      bool isLoading = state is MedicalHistoryLoading;
                      return CustomBottomSheet(
                        isLoading: isLoading,
                        title: 'Add Medical History'.tr(),
                        onButtonPressed: (title, description) {
                          context.read<MedicalHistoryCubit>().addMedicalHistory(
                            model: MedicalHistoryModel(
                              uid: userModel.uid,
                              title: title,
                              description: description,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
