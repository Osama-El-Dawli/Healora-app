import 'package:flutter/material.dart';
import 'package:healora/features/medical_history/presentation/widgets/CustomBottom.dart';

class BottomBody extends StatefulWidget {
  const BottomBody({super.key});

  @override
  State<BottomBody> createState() => _BottomBodyState();
}

class _BottomBodyState extends State<BottomBody> {
  final TextEditingController _TitleControlar=TextEditingController();
  final TextEditingController _descriptionControlar =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
        top: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBottom(
            Controlar:_TitleControlar,
            hintText: "write the Title ",
            MaxLine: 2,

          ),
          const SizedBox(height: 20),
          CustomBottom(
              Controlar: _descriptionControlar,
              hintText: "write the description",
              MaxLine: 3),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child:Text("Save"))
        ],
      ),
    );
  }
}