import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final TextEditingController _titleControlar = TextEditingController();
  final TextEditingController _descriptionControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: _titleControlar,
            hintText: "write the Title",
            maxLines: 2,
          ),
          CustomTextFormField(
            controller: _descriptionControlar,
            hintText: "write the description",
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
