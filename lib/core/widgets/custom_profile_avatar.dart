import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (imageUrl.startsWith('/data/') || imageUrl.startsWith('/storage/')) {
      imageProvider = FileImage(File(imageUrl));
    } else {
      imageProvider = AssetImage(imageUrl);
    }

    return CircleAvatar(
      backgroundColor: const Color(0xffEAF2F7),
      radius: 24.r,
      child: CircleAvatar(radius: 18.r, backgroundImage: imageProvider),
    );
  }
}
