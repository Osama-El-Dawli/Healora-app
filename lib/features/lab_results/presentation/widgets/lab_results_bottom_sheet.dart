import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.titleField ?? '');
    _descriptionController = TextEditingController(
      text: widget.descriptionField ?? '',
    );
    super.initState();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to pick image: ${e.toString()}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void _showZoomDialog(ImageProvider imageProvider) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4,
          child: Image(image: imageProvider),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        left: 16.w,
        right: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                if (_imageFile == null && widget.imageUrl == null) {
                  _pickImage();
                }
              },
              child: Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.primary),
                ),
                child: _imageFile != null || widget.imageUrl != null
                    ? Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              final imageProvider = _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : NetworkImage(widget.imageUrl!)
                                        as ImageProvider;
                              _showZoomDialog(imageProvider);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: _imageFile != null
                                  ? Image.file(
                                      _imageFile!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  : Image.network(
                                      widget.imageUrl!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                            ),
                          ),
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.2,
                                      ),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 40.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Add Image',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
              ),
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
                    msg: "Please select an image",
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
    );
  }
}
