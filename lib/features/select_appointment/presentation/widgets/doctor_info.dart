import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class DoctorInfo extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  const DoctorInfo({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/$image.png"),
        ),
        title: Text(name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          specialty,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
