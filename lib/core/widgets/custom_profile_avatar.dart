import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
>>>>>>> d169923088cd0a4f18e34295af333293f35c0660

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffEAF2F7),
<<<<<<< HEAD
      radius: 23.r,
      child: CircleAvatar(
        radius: 15.r,
=======
      radius: 23,
      child: CircleAvatar(
        radius: 15,
>>>>>>> d169923088cd0a4f18e34295af333293f35c0660
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
