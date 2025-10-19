import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomeTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPhone; // ✅ لتحديد إذا كان الحقل خاص بالهاتف

  const CustomeTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.isPhone = false, // ✅ القيمة الافتراضية false
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
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primary,
        keyboardType: widget.isPhone ? TextInputType.phone : TextInputType.text,

        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.isPhone
              ? Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 6.w),
                  child: Text(
                    '+2',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
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
