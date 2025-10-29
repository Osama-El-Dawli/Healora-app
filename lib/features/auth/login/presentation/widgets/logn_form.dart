import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/validators/form_validators.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';
import 'package:healora/features/auth/login/cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
