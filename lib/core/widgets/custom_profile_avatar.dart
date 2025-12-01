import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/utils/app_assets.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.imageUrl, this.radius1, this.radius2});
  final String imageUrl;
  final double? radius1, radius2;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffEAF2F7),
      radius: radius1 ?? 24.r,
      child: CircleAvatar(
        radius:  radius2 ?? 18.r,
        backgroundImage: imageUrl.startsWith('http')
            ? NetworkImage(imageUrl)
            : const AssetImage(Assets.imagesAvatar),
      ),
    );
  }
}
