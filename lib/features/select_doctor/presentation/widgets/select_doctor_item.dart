import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class DoctorItem extends StatelessWidget {
  String name;
  String specialty;
  IconData icon;
  String image;
  DoctorItem({required this.name,
    required this.specialty,
    required this.icon,
    required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.lightGray,
      borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/${image}.png"),
        ),
        title: Text(name,
          style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(specialty,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primary),
         ),
        trailing: Icon(icon,color: AppColors.secondary,size: 30,),
        onTap: () {},
      ),
    );
  }
}

