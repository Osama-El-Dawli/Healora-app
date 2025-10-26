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
import 'package:healora/features/auth/login/cubit/login_cubit.dart';
import 'package:healora/features/auth/login/cubit/login_state.dart';
import 'package:healora/features/auth/login/presentation/widgets/do_not_have_account.dart';
import 'package:healora/features/auth/login/presentation/widgets/logn_form.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = AppRoutes.loginScreen;
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: "login_successfully".tr(),
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
          } else if (state is LoginFailure) {
            Navigator.pop(context);
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
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthHeader(
                      message: 'welcome_back'.tr(),
                      action: 'login'.tr(),
                    ),
                    LoginForm(),
                    DoNotHaveAccount(),
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
