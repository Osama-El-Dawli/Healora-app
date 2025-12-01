import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_body.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_bottom_sheet.dart';

class LabResultsScreen extends StatelessWidget {
  const LabResultsScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LabResultsCubit, LabResultsState>(
      listener: (context, state) {
        if (state is LabResultsAdded) {
          Navigator.pop(context);

          context.read<LabResultsCubit>().getLabResultsList(uid: userModel.uid);

          Fluttertoast.showToast(
            msg: "added_successfully".tr(),
            backgroundColor: AppColors.secondary,
            textColor: Colors.white,
          );
        } else if (state is LabResultsFailure) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      child: Scaffold(
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
              builder: (_) => BlocProvider.value(
                value: context.read<LabResultsCubit>(),
                child: BlocBuilder<LabResultsCubit, LabResultsState>(
                  builder: (_, state) {
                    bool isLoading = state is LabResultsLoading;

                    return LabResultsBottomSheet(
                      isLoading: isLoading,
                      title: 'Add Lab Result',
                      onButtonPressed: (title, description, imageFile) {
                        context.read<LabResultsCubit>().addLabResults(
                          model: LabResultsModel(
                            uid: userModel.uid,
                            title: title,
                            description: description,
                          ),
                          imageFile: imageFile,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
