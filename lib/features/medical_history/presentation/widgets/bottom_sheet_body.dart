import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key, required this.user});
  final UserModel user;

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalHistoryCubit, MedicalHistoryState>(
      listener: (context, state) {
        if (state is MedicalHistoryAdded) {
          Fluttertoast.showToast(
            msg: "added_successfully".tr(),
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.pop(context);
        }
        if (state is MedicalHistoryFailure) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  controller: _titleController,
                  hintText: "Write the title".tr(),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Title is required".tr();
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _descriptionController,
                  hintText: "Write the description".tr(),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Description is required".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<MedicalHistoryCubit>().addMedicalHistory(
                        model: MedicalHistoryModel(
                          title: _titleController.text.trim(),
                          description: _descriptionController.text.trim(),
                          uid: widget.user.uid,
                        ),
                      );
                      context.read<MedicalHistoryCubit>().getMedicalHistoryList(
                        uid: widget.user.uid,
                      );
                    }
                  },
                  child: state is MedicalHistoryLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            padding: EdgeInsets.all(12.r),
                            color: Colors.white,
                          ),
                        )
                      : const Text("Save"),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
