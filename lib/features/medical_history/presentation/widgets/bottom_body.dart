import 'package:flutter/material.dart';
import 'package:healora/features/medical_history/presentation/widgets/custom_bottom.dart';

class BottomBody extends StatefulWidget {
  const BottomBody({super.key});

  @override
  State<BottomBody> createState() => _BottomBodyState();
}

class _BottomBodyState extends State<BottomBody> {
  final TextEditingController _titleControlar = TextEditingController();
  final TextEditingController _descriptionControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBottom(
            controller: _titleControlar,
            hintText: "write the Title ",
            maxLine: 2,
          ),
          const SizedBox(height: 20),
          CustomBottom(
            controller: _descriptionControlar,
            hintText: "write the description",
            maxLine: 3,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
