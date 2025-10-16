import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TextForm extends StatelessWidget {
  String hinttext;
   TextForm({required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppColors.lightGray, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: AppColors.gray, width: 1.5),
    ),


    hintText:hinttext,
      suffix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        Image.asset("assets/images/select.png", height: 20),
        SizedBox(width: 10),
        Image.asset("assets/images/send.png", height: 20),
      ],),
    ),
     style: Theme.of(context).textTheme.displaySmall!.copyWith(
      fontSize: 15,
      color: AppColors.primary,
      fontWeight: FontWeight.w500,
     ));


  }
}
