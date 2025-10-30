import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final Controlar;
  final hintText;
  final MaxLine;


  const CustomBottom({super.key,required this.Controlar,required this.hintText,required this.MaxLine});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controlar,
      maxLines: MaxLine,
      decoration: InputDecoration(
        hintText:hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardAppearance:Brightness.dark,

    );
  }
}