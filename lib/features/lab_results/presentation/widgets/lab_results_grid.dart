import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_results_bottom_sheet.dart';
import 'lab_results_card.dart';

class LabCardGrid extends StatelessWidget {
  const LabCardGrid({super.key, required this.items, required this.user});

  final UserModel user;
  final List<LabResultsModel> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
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
                      value: BlocProvider.of<LabResultsCubit>(context),
                      child: BlocBuilder<LabResultsCubit, LabResultsState>(
                        builder: (_, state) {
                          bool isLoading = state is LabResultsLoading;
                          return LabResultsBottomSheet(
                            isLoading: isLoading,
                            titleField: items[index].title,
                            descriptionField: items[index].description,
                            imageUrl: items[index].imageUrl,
                            title: 'Edit Lab Result'.tr(),
                            onButtonPressed: (title, description, imageFile) {
                              context.read<LabResultsCubit>().updateLabResults(
                                docId: items[index].id!,
                                model: LabResultsModel(
                                  id: items[index].id,
                                  uid: items[index].uid,
                                  title: title,
                                  description: description,
                                  imageUrl: items[index].imageUrl,
                                ),
                                imageFile: imageFile,
                              );

                              context.read<LabResultsCubit>().getLabResultsList(
                                uid: user.uid,
                              );

                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
                child: LabResultCard(model: items[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
