import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';

class MedicalHistoryBottomSheet extends StatefulWidget {
  final UserModel? user;
  final MedicalHistoryModel? model;

  const MedicalHistoryBottomSheet({super.key, this.user, this.model});

  @override
  State<MedicalHistoryBottomSheet> createState() =>
      _MedicalHistoryBottomSheetState();
}

class _MedicalHistoryBottomSheetState extends State<MedicalHistoryBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  bool get isEdit => widget.model != null;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.model?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.model?.description ?? '',
    );
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSaveOrUpdate() {
    if (!_formKey.currentState!.validate()) return;

    final cubit = context.read<MedicalHistoryCubit>();

    if (isEdit) {
      cubit.updateMedicalHistory(
        docId: widget.model!.id!,
        model: MedicalHistoryModel(
          id: widget.model!.id,
          uid: widget.model!.uid,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ),
      );
    } else {
      cubit.addMedicalHistory(
        model: MedicalHistoryModel(
          uid: widget.user!.uid,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalHistoryCubit, MedicalHistoryState>(
      listener: (context, state) {
        final cubit = context.read<MedicalHistoryCubit>();
        if ((isEdit && state is MedicalHistoryUpdated) ||
            (!isEdit && state is MedicalHistoryAdded)) {
          Fluttertoast.showToast(
            msg: isEdit
                ? "updated_successfully".tr()
                : "added_successfully".tr(),
            backgroundColor: AppColors.secondary,
            textColor: Colors.white,
          );
          Navigator.pop(context);
          if (!isEdit) {
            cubit.getMedicalHistoryList(uid: widget.user!.uid);
          }
        }
        if (state is MedicalHistoryFailure) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 24.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEdit
                      ? "Edit Medical History".tr()
                      : "Add Medical History".tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _titleController,
                  hintText: "Write the title".tr(),
                  maxLines: 2,
                  validator: (value) =>
                      value!.trim().isEmpty ? "Title is required".tr() : null,
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  controller: _descriptionController,
                  hintText: "Write the description".tr(),
                  maxLines: 3,
                  validator: (value) => value!.trim().isEmpty
                      ? "Description is required".tr()
                      : null,
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: state is MedicalHistoryLoading
                      ? null
                      : _onSaveOrUpdate,
                  child: state is MedicalHistoryLoading
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text(isEdit ? "Save Changes".tr() : "Save".tr()),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
