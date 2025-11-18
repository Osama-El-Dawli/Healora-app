import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/lab_results/data/models/lab_results_model.dart';
import 'package:healora/features/lab_results/presentation/widgets/lab_result_card.dart';

class LabCardGrid extends StatelessWidget {
  const LabCardGrid({super.key});

  static final List<LabResultsModel> models = [
    LabResultsModel(
      id: "1",
      title: "Complete Blood Count (CBC)",
      description:
          "Measures the levels of red, white blood cells and platelets to check for anemia or infection",
    ),
    LabResultsModel(
      id: "2",
      title: "Vitamin D Test",
      description:
      "Evaluates overall cholesterol levels including HDL, LDL, and triglycerides",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
    LabResultsModel(
      id: "3",
      title: "Lipid Profile",
      description:
      "helps monitor blood sugar control over the past 3 months.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
        ),
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              verticalOffset: 100.0,
              child: FadeInAnimation(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {},
                  child: LabResultCard(
                    title: models[index].title,
                    description: models[index].description,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
