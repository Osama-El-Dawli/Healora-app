import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffEAF2F7),
      radius: 23,
      child: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
