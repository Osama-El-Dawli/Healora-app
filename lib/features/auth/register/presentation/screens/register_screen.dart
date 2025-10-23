import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/validators/form_validators.dart';
import 'package:healora/core/widgets/auth_header.dart';
import 'package:healora/core/widgets/custom_dropdown_button.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/core/widgets/lang_toggle.dart';
import 'package:healora/core/widgets/loading_indicator.dart';
import 'package:healora/features/auth/register/cubit/register_cubit.dart';
import 'package:healora/features/auth/register/cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = AppRoutes.registerScreen;

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedRole;
  String? selectedSpecialization;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = ['doctor', 'patient'];
    final List<String> specializations = [
      'general_practitioner',
      'cardiologist',
      'dermatologist',
      'pediatrician',
      'orthopedic_doctor',
      'neurologist',
      'ophthalmologist',
      'dentist',
      'gynecologist',
    ];

    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Fluttertoast.showToast(
              msg: "account_created_successfully".tr(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: AppColors.secondary,
              textColor: AppColors.backgroundColor,
              fontSize: 16.sp,
            );

            Navigator.of(
              context,
            ).pushReplacementNamed(AppRoutes.homeScreen, arguments: state.user);
          } else if (state is RegisterFailure) {
            Fluttertoast.showToast(
              msg: " ${state.error}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: AppColors.red,
              textColor: AppColors.backgroundColor,
              fontSize: 16.sp,
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthHeader(
                            message: 'hello_beautiful'.tr(),
                            action: 'sign_up'.tr(),
                          ),
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
                            validator: (value) =>
                                FormValidators.validateConfirmPassword(
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
                              hintText: 'specialization'.tr(),
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'already_have_an_account?'.tr(),
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(color: AppColors.darkGreen),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'login'.tr(),
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),

                          LanguageSwitchRow(
                            currentLang: context.locale.languageCode,
                            onSelect: (lang) async {
                              await context.setLocale(Locale(lang));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state is RegisterLoading) const LoadingIndicator(),
            ],
          );
        },
      ),
    );
  }
}
