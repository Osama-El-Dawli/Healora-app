import 'package:flutter/material.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_card.dart';

class MedicalHistoryGrid extends StatelessWidget {
  const MedicalHistoryGrid({super.key});

  static const List<MedicalHistoryCardModel> items = [
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
    MedicalHistoryCardModel(
      title: 'Medical History Title',
      description: 'Brief description of the medical history entry goes here.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MedicalHistoryCard(model: items[index]);
      },
    );
  }
}
