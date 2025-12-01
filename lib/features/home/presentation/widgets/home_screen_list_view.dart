import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/home/data/models/home_screen_model.dart';
import 'package:healora/core/widgets/custom_card.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({super.key, required this.user});
  final UserModel user;

  static final List<HomeScreenModel> items = [
    HomeScreenModel(
      image: 'assets/images/home_page4.png',
      title: 'Your Diet Chart',
      route: AppRoutes.dietChartScreen,
    ),
    HomeScreenModel(
      image: 'assets/images/home_page2.png',
      title: 'Lab Results',
      route: AppRoutes.labResultsScreen,
    ),
    HomeScreenModel(
      image: 'assets/images/home_page3.png',
      title: 'Choose a Doctor',
      route: AppRoutes.chooseSpecialtyScreen,
    ),
    HomeScreenModel(
      image: 'assets/images/home_page1.png',
      title: 'Medical History',
      route: AppRoutes.medicalHistoryScreen,
    ),
    HomeScreenModel(
      image: 'assets/images/home_page5.png',
      title: 'ChatBot',
      route: AppRoutes.chatBotScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            verticalOffset: 100.0,
            curve: Curves.easeOutCubic,
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    switch (items[index].route) {
                      case AppRoutes.medicalHistoryScreen:
                        Navigator.pushNamed(
                          context,
                          items[index].route,
                          arguments: user,
                        );
                        break;
                      case AppRoutes.chooseSpecialtyScreen:
                        Navigator.pushNamed(
                          context,
                          items[index].route,
                          arguments: user,
                        );
                        break;
                        case AppRoutes.labResultsScreen:
                        Navigator.pushNamed(
                          context,
                          items[index].route,
                          arguments: user,
                        );
                        break;
                      default:
                        Navigator.pushNamed(context, items[index].route);
                    }
                  },
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: items[index].title,
                    child: CustomCard(
                      title: items[index].title.tr(),
                      imageUrl: items[index].image,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
