import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_bottom_sheet.dart';
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
        return AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 2,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            verticalOffset: 100.0,
            child: FadeInAnimation(
              child: InkWell(
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                    ),
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<MedicalHistoryCubit>(context),
                      child: MedicalHistoryBottomSheet(model: items[index]),
                    ),
                  );
                },
                child: MedicalHistoryCard(model: items[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
