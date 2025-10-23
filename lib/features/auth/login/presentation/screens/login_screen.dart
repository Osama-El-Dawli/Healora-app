import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/validators/form_validators.dart';
import 'package:healora/core/widgets/auth_header.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/core/widgets/lang_toggle.dart';
import 'package:healora/core/widgets/loading_indicator.dart';
import 'package:healora/features/auth/login/cubit/login_cubit.dart';
import 'package:healora/features/auth/login/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = AppRoutes.loginScreen;
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Fluttertoast.showToast(
              msg: "login_successfully".tr(),
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
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(
              msg: state.generalError!,
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
                            message: 'welcome_back'.tr(),
                            action: 'login'.tr(),
                          ),
                          CustomTextFormField(
                            hintText: 'email'.tr(),
                            controller: emailController,
                            validator: FormValidators.validateLoginEmail,
                          ),
                          CustomTextFormField(
                            hintText: 'password'.tr(),
                            isPassword: true,
                            controller: passwordController,
                            validator: FormValidators.validateLoginPassword,
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                }
                              },
                              label: 'login'.tr(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'dont_have_an_account?'.tr(),
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.darkGreen,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.registerScreen,
                                  );
                                },
                                child: Text(
                                  'sign_up'.tr(),
                                  style: textTheme.labelLarge?.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
              if (state is LoginLoading) const LoadingIndicator(),
            ],
          );
        },
      ),
    );
  }
}
