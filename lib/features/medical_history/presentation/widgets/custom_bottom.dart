import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;

  const CustomBottom({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      keyboardAppearance: Brightness.dark,
    );
  }
}
