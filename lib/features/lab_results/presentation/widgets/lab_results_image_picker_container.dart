import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class LabResultsImagePickerContainer extends StatefulWidget {
  const LabResultsImagePickerContainer({
    super.key,
    this.imageUrl,
    required this.onImagePicked,
  });

  final String? imageUrl;
  final void Function(File? imageFile) onImagePicked;

  @override
  State<LabResultsImagePickerContainer> createState() =>
      _LabResultsImagePickerContainerState();
}

class _LabResultsImagePickerContainerState
    extends State<LabResultsImagePickerContainer> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

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
        widget.onImagePicked(_imageFile);
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
    return InkWell(
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
                  InkWell(
                    onTap: () {
                      final imageProvider = _imageFile != null
                          ? FileImage(_imageFile!)
                          : NetworkImage(widget.imageUrl!) as ImageProvider;
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
                              color: Colors.black.withValues(alpha: 0.2),
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
                    style: TextStyle(color: AppColors.primary, fontSize: 14.sp),
                  ),
                ],
              ),
      ),
    );
  }
}
