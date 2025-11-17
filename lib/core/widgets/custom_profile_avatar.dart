import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/utils/app_assets.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffEAF2F7),
      radius: 24.r,
      child: CircleAvatar(
        radius: 18.r,
        backgroundImage: imageUrl.startsWith('http')
            ? NetworkImage(imageUrl)
            : const AssetImage(Assets.imagesAvatar),
      ),
    );
  }
}
