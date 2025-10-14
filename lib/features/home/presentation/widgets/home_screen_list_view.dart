import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/home/data/models/home_screen_model.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_cards.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({super.key});

  static const List<HomeScreenModel> items = [
    HomeScreenModel(
      image: 'assets/images/home_page1.png',
      title: 'Medical History',
    ),
    HomeScreenModel(
      image: 'assets/images/home_page2.png',
      title: 'Lab Results',
    ),
    HomeScreenModel(
      image: 'assets/images/home_page3.png',
      title: 'Choose a Doctor',
    ),
    HomeScreenModel(
      image: 'assets/images/home_page4.png',
      title: 'Your Diet Chart',
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
            child: HomeScreenCard(model: items[index]),
          ),
        );
      },
    );
  }
}
