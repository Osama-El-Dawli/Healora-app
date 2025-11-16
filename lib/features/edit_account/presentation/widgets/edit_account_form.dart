import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/presentation/widgets/change_avatar.dart';

class EditAccountForm extends StatelessWidget {
  const EditAccountForm({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.83,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              ChangeAvatar(user: user),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(initialValue: user.firstName),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextFormField(initialValue: user.lastName),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              CustomTextFormField(initialValue: user.phoneNumber),
              SizedBox(height: 8.h),

              CustomTextFormField(initialValue: user.email, readOnly: true),
              SizedBox(height: 8.h),

              CustomTextFormField(readOnly: true, initialValue: user.role.tr()),
              if (user.specialization != '') ...[
                SizedBox(height: 8.h),
                CustomTextFormField(
                  readOnly: true,
                  initialValue: user.specialization.tr(),
                ),
              ],
              Spacer(),
              CustomElevatedButton(
                label: 'Save',
                onPressed: () {},
                color: Theme.brightnessOf(context) == Brightness.dark
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
