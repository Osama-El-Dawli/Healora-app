import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/presentation/widgets/change_avatar.dart';

class EditAccountFormFields extends StatefulWidget {
  const EditAccountFormFields({super.key});

  @override
  State<EditAccountFormFields> createState() => _EditAccountFormFieldsState();
}

class _EditAccountFormFieldsState extends State<EditAccountFormFields> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController roleController;
  late final TextEditingController specializationController;

  File? selectedImageFile;

  @override
  void initState() {
    super.initState();
    final user = context.read<UpdateAccountCubit>().userModel!;

    firstNameController = TextEditingController(text: user.firstName);
    lastNameController = TextEditingController(text: user.lastName);
    phoneController = TextEditingController(text: user.phoneNumber);
    emailController = TextEditingController(text: user.email);
    roleController = TextEditingController(text: user.role.tr());
    specializationController = TextEditingController(
      text: user.specialization.tr(),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    roleController.dispose();
    specializationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateCubit = context.read<UpdateAccountCubit>();
    final user = updateCubit.userModel!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.83,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              ChangeAvatar(
                user: user,
                onImagePicked: (file) {
                  setState(() {
                    selectedImageFile = file;
                  });
                },
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(controller: firstNameController),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextFormField(controller: lastNameController),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(controller: phoneController),
              SizedBox(height: 8.h),
              CustomTextFormField(controller: emailController, readOnly: true),
              SizedBox(height: 8.h),
              CustomTextFormField(controller: roleController, readOnly: true),
              if (user.specialization != '') ...[
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: specializationController,
                  readOnly: true,
                ),
              ],
              Spacer(),
              CustomElevatedButton(
                label: 'Save',
                onPressed: () {
                  updateCubit.updateAccount(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phone: phoneController.text,
                    image: selectedImageFile,
                  );
                },
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
