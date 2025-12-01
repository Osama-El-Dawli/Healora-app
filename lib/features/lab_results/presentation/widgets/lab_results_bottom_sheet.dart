import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_image_picker_container.dart';

class LabResultsBottomSheet extends StatefulWidget {
  const LabResultsBottomSheet({
    super.key,
    required this.title,
    this.titleField,
    this.descriptionField,
    this.imageUrl,
    this.isLoading = false,
    required this.onButtonPressed,
  });
  final String title;
  final String? titleField, descriptionField, imageUrl;
  final bool isLoading;
  final void Function(String title, String description, File? imageFile)
  onButtonPressed;

  @override
  State<LabResultsBottomSheet> createState() => _LabResultsBottomSheetState();
}

class _LabResultsBottomSheetState extends State<LabResultsBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  File? _imageFile;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.titleField ?? '');
    _descriptionController = TextEditingController(
      text: widget.descriptionField ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        left: 16.w,
        right: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom > 0
            ? MediaQuery.of(context).viewInsets.bottom
            : 24.h,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16.h),
              LabResultsImagePickerContainer(
                imageUrl: widget.imageUrl,
                onImagePicked: (imageFile) {
                  setState(() {
                    _imageFile = imageFile;
                  });
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: _titleController,
                hintText: 'Enter the title'.tr(),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title is required'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                controller: _descriptionController,
                hintText: 'Enter the description'.tr(),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description is required'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                child: widget.isLoading
                    ? SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text('save'.tr()),
                onPressed: () {
                  if (_imageFile == null && widget.imageUrl == null) {
                    Fluttertoast.showToast(
                      msg: "please_select_an_image".tr(),
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    widget.onButtonPressed(
                      _titleController.text.trim(),
                      _descriptionController.text.trim(),
                      _imageFile,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
