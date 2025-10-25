import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/select_appointment/presentation/widgets/date_item.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  int _selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();

  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 50.w,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Select date".tr(),
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (_selectedIndex == -1) {
                  return;
                } else {
                  setState(() {
                    _selectedIndex--;
                  });
                }
                scrollToIndex(_selectedIndex);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            Expanded(
              child: SizedBox(
                height: 70.h,
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (_, index) => SizedBox(width: 10.w),
                  itemBuilder: (_, index) =>
                      AnimationConfiguration.staggeredList(
                        delay: const Duration(milliseconds: 100),
                        duration: const Duration(milliseconds: 500),
                        position: index,
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          curve: Curves.easeOutCubic,
                          child: FadeInAnimation(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.r),
                              onTap: () {
                                if (index != _selectedIndex) {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                }
                              },
                              child: DateItem(
                                isSelected: index == _selectedIndex,
                                dayName: 'Mon',
                                dayNumber: '22',
                              ),
                            ),
                          ),
                        ),
                      ),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (_selectedIndex == 5) {
                  return;
                } else {
                  setState(() {
                    _selectedIndex++;
                  });
                }
                scrollToIndex(_selectedIndex);
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
