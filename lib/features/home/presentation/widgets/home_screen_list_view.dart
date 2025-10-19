import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/home/data/models/home_screen_model.dart';
import 'package:healora/core/widgets/custom_card.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({super.key});

  static List<HomeScreenModel> items = [
    HomeScreenModel(
      image: 'assets/images/home_page1.png',
      title: 'Medical History'.tr(),
    ),
    HomeScreenModel(
      image: 'assets/images/home_page2.png',
      title: 'Lab Results'.tr(),
    ),
    HomeScreenModel(
      image: 'assets/images/home_page3.png',
      title: 'Choose a Doctor'.tr(),
    ),
    HomeScreenModel(
      image: 'assets/images/home_page4.png',
      title: 'Your Diet Chart'.tr(),
    ),
    HomeScreenModel(image: 'assets/images/home_page5.png', title: 'ChatBot'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.r),
            onTap: () {},
            child: CustomCard(
              title: items[index].title,
              imageUrl: items[index].image,
            ),
          ),
        );
      },
    );
  }
}
