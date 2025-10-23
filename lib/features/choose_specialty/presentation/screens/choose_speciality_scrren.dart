import 'package:flutter/material.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_speciality_body.dart';

class ChooseSpecialityScrren extends StatefulWidget {
  const ChooseSpecialityScrren({super.key});

  @override
  State<ChooseSpecialityScrren> createState() => _ChooseSpecialityScrrenState();
}

class _ChooseSpecialityScrrenState extends State<ChooseSpecialityScrren> {
  @override
  Widget build(BuildContext context) {
    return ChooseSpecialityBody();
  }
}
