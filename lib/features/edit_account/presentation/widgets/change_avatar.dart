import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatar extends StatefulWidget {
  const ChangeAvatar({
    super.key,
    required this.user,
    required this.onImagePicked,
  });
  final UserModel user;
  final void Function(File file)? onImagePicked;

  @override
  State<ChangeAvatar> createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      setState(() {
        _selectedImage = file;
        widget.user.imageUrl = file.path;
        widget.onImagePicked?.call(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(80.r),
          ),
          height: 150,
          width: 150,
          child: CircleAvatar(
            radius: 28.r,
            backgroundImage: _selectedImage != null
                ? FileImage(_selectedImage!)
                : (widget.user.imageUrl.isNotEmpty
                      ? (widget.user.imageUrl.startsWith('/data/')
                            ? FileImage(File(widget.user.imageUrl))
                            : Uri.tryParse(widget.user.imageUrl)?.isAbsolute ==
                                  true
                            ? NetworkImage(widget.user.imageUrl)
                            : AssetImage('assets/images/avatar.png'))
                      : const AssetImage('assets/images/avatar.png')),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
            child: InkWell(
              splashColor: AppColors.darkTextPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(28.r),
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.2),
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(28.r)),
                ),
                child: Icon(Icons.edit, color: AppColors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
