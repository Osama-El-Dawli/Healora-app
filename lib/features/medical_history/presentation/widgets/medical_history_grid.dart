import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_card.dart';

class MedicalHistoryGrid extends StatelessWidget {
  const MedicalHistoryGrid({
    super.key,
    required this.user,
    required this.items,
  });
  final UserModel user;
  final List<MedicalHistoryModel> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MedicalHistoryCard(model: items[index]);
      },
    );
  }
}
