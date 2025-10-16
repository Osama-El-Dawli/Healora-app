import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomMedicalHistory extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final DateTime? date;
  const CustomMedicalHistory({super.key,   this.title,  this.subtitle,  this.date});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color:  AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(10),
      padding:EdgeInsets.all(10) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${date?.year},${date?.month},${date?.day}",style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.primary,
          ),maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          Text(title??"",style: TextStyle(
            fontSize: 15,fontWeight: FontWeight.bold,color: AppColors.primary,
          ),maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          Text(subtitle??"Lorem ipsum dolor sit amet, consectetur Lo...",style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.primary,
          ),maxLines: 2,
            overflow: TextOverflow.ellipsis,),

        ],
      ),
    );
  }
}
