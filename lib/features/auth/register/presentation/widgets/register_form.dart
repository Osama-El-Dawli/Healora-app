import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/validators/form_validators.dart';
import 'package:healora/core/widgets/custom_dropdown_button.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/register/cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? selectedRole;
  String? selectedSpecialization;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final items = ['doctor', 'patient'];
  final List<String> specializations = [
    'Cardiology',
    'Pathology',
    'Hepatology',
    'Pulmonology',
    'Ophthalmology',
    'Nephrology',
    'Radiology',
    'Physiotherapy',
    'Gastroenterology',
    'Psychiatry',
    'General Internal Medicine',
  ];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: firstNameController,
                  validator: FormValidators.validateName,
                  hintText: 'first_name'.tr(),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomTextFormField(
                  controller: lastNameController,
                  validator: FormValidators.validateName,
                  hintText: 'last_name'.tr(),
                ),
              ),
            ],
          ),
          CustomTextFormField(
            controller: emailController,
            validator: FormValidators.validateEmail,
            hintText: 'email'.tr(),
          ),
          CustomTextFormField(
            controller: passwordController,
            validator: FormValidators.validatePassword,
            isPassword: true,
            hintText: 'password'.tr(),
          ),
          CustomTextFormField(
            controller: confirmPasswordController,
            validator: (value) => FormValidators.validateConfirmPassword(
              value,
              passwordController.text,
            ),
            isPassword: true,
            hintText: 'confirm_password'.tr(),
          ),

          CustomTextFormField(
            controller: phoneController,
            validator: FormValidators.validatePhone,
            hintText: 'phone_number'.tr(),
            isPhone: true,
          ),
          CustomDropdownButton(
            items: items,
            selectedValue: selectedRole,
            onChanged: (value) {
              setState(() {
                selectedRole = value;
              });
            },
            hintText: 'role',
            msg: 'please_select_a_role',
          ),
          if (selectedRole == 'doctor') ...[
            SizedBox(height: 12.h),
            CustomDropdownButton(
              items: specializations,
              selectedValue: selectedSpecialization,
              onChanged: (value) {
                setState(() {
                  selectedSpecialization = value;
                });
              },
              hintText: 'specialization',
              msg: 'please_select_a_specialization',
            ),
          ],
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              label: 'sign_up'.tr(),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (formKey.currentState!.validate()) {
                  context.read<RegisterCubit>().register(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    phoneNumber: phoneController.text.trim(),
                    role: selectedRole ?? ''.trim(),
                    specialization: selectedRole == 'doctor'
                        ? selectedSpecialization ?? ''
                        : '',
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
