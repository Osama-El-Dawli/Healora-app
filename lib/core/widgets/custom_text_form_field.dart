import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPhone;
  final int maxLines;
  bool readOnly;
  String initialValue;

  CustomTextFormField({
    super.key,
    this.hintText = '',
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.isPhone = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.initialValue = '',
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        initialValue: widget.controller == null ? widget.initialValue : null,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primary,
        cursorErrorColor: AppColors.red,

        keyboardType: widget.isPhone ? TextInputType.phone : TextInputType.text,

        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : AppColors.primary,
        ),
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
