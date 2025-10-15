import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomeTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const CustomeTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),

      child: TextFormField(
        obscureText: isObscure,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.suffixIconColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
