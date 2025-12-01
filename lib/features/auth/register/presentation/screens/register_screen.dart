import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/auth_header.dart';
import 'package:healora/core/widgets/lang_toggle.dart';
import 'package:healora/core/widgets/loading_indicator.dart';
import 'package:healora/features/auth/register/cubit/register_cubit.dart';
import 'package:healora/features/auth/register/cubit/register_state.dart';
import 'package:healora/features/auth/register/presentation/widgets/have_account.dart';
import 'package:healora/features/auth/register/presentation/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = AppRoutes.registerScreen;

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: "account_created_successfully".tr(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: AppColors.secondary,
              textColor: AppColors.backgroundColor,
              fontSize: 16.sp,
            );
            Navigator.of(context).pushReplacementNamed(
              state.user.role == 'doctor'
                  ? AppRoutes.doctorScreen
                  : AppRoutes.homeScreen,
              arguments: state.user,
            );
          } else if (state is RegisterFailure) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: " ${state.error}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: AppColors.red,
              textColor: AppColors.backgroundColor,
              fontSize: 16.sp,
            );
          } else if (state is RegisterLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthHeader(
                      message: 'hello_beautiful'.tr(),
                      action: 'sign_up'.tr(),
                    ),
                    RegisterForm(),
                    HaveAccount(),
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
          );
        },
      ),
    );
  }
}
