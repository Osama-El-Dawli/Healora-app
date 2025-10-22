import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/validators/form_validators.dart';
import 'package:healora/core/widgets/auth_header.dart';
import 'package:healora/core/widgets/custome_elevated_button.dart';
import 'package:healora/core/widgets/custome_text_form_field.dart';
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
  String? selectedValue;
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final items = ['doctor', 'patient'];

    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Fluttertoast.showToast(
              msg: "Account Created Successfully".tr(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: AppColors.secondary,
              textColor: AppColors.backgroundColor,
              fontSize: 16.sp,
            );

            Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
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
                                child: CustomeTextFormField(
                                  controller: firstNameController,
                                  validator: FormValidators.validateName,
                                  hintText: 'first_name'.tr(),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: CustomeTextFormField(
                                  controller: lastNameController,
                                  validator: FormValidators.validateName,
                                  hintText: 'last_name'.tr(),
                                ),
                              ),
                            ],
                          ),
                          CustomeTextFormField(
                            controller: emailController,
                            validator: FormValidators.validateEmail,
                            hintText: 'email'.tr(),
                          ),
                          CustomeTextFormField(
                            controller: passwordController,
                            validator: FormValidators.validatePassword,
                            isPassword: true,
                            hintText: 'password'.tr(),
                          ),
                          CustomeTextFormField(
                            controller: confirmPasswordController,
                            validator: (value) =>
                                FormValidators.validateConfirmPassword(
                                  value,
                                  passwordController.text,
                                ),
                            isPassword: true,
                            hintText: 'confirm_password'.tr(),
                          ),

                          CustomeTextFormField(
                            controller: phoneController,
                            validator: FormValidators.validatePhone,
                            hintText: 'phone_number'.tr(),
                            isPhone: true,
                          ),
                          DropdownButtonFormField<String>(
                            dropdownColor: AppColors.backgroundColor,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.primary,
                            ),
                            style: textTheme.titleSmall!.copyWith(
                              color: AppColors.primary,
                            ),
                            initialValue: selectedValue,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.backgroundColor,
                              hint: Text(
                                'role'.tr(),
                                style: TextStyle(
                                  color: AppColors.hintColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item.tr()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please_select_a_role'.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: double.infinity,
                            child: CustomeElevatedButton(
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
                                    role: selectedValue ?? ''.trim(),
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
