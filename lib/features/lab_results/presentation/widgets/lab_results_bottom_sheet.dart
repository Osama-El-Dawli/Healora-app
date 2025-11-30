import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';

class LabResultsBottomSheet extends StatefulWidget {
  final UserModel? user;
  final LabResultsModel? model;

  const LabResultsBottomSheet({super.key, this.user, this.model});

  @override
  State<LabResultsBottomSheet> createState() => _LabResultsBottomSheetState();
}

class _LabResultsBottomSheetState extends State<LabResultsBottomSheet> {
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

    final cubit = context.read<LabResultsCubit>();

    if (isEdit) {
      cubit.updateLabResults(
        docId: widget.model!.id!,
        model: LabResultsModel(
          id: widget.model!.id,
          uid: widget.model!.uid,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ),
      );
    } else {
      cubit.addLabResults(
        model: LabResultsModel(
          uid: widget.user!.uid,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LabResultsCubit, LabResultsState>(
      listener: (context, state) {
        final cubit = context.read<LabResultsCubit>();
        if ((isEdit && state is LabResultsUpdated) ||
            (!isEdit && state is LabResultsAdded)) {
          Fluttertoast.showToast(
            msg: isEdit
                ? "updated_successfully".tr()
                : "added_successfully".tr(),
            backgroundColor: AppColors.secondary,
            textColor: Colors.white,
          );
          Navigator.pop(context);
          if (!isEdit) {
            cubit.getLabResultsList(uid: widget.user!.uid);
          }
        }
        if (state is LabResultsFailure) {
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
                  isEdit ? "Edit Lab Results".tr() : "Add Lab Results".tr(),
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
                  onPressed: state is LabResultsLoading
                      ? null
                      : _onSaveOrUpdate,
                  child: state is LabResultsLoading
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
