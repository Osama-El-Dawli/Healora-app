import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/select_appointment/presentation/widgets/date_item.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({
    super.key,
    required this.onDateSelected,
    required this.initialSelectedDate,
  });

  final Function(DateTime) onDateSelected;
  final DateTime initialSelectedDate;

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  List<DateTime> getWeekDates() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    List<DateTime> dates = [];
    DateTime current = tomorrow;

    while (dates.length < 6) {
      if (current.weekday != DateTime.friday) {
        dates.add(current);
      }
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  @override
  void initState() {
    super.initState();
    final dates = getWeekDates();
    _selectedIndex = dates.indexWhere(
      (d) =>
          DateFormat('dd MMM').format(d) ==
          DateFormat('dd MMM').format(widget.initialSelectedDate),
    );
  }

  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 50.w,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dates = getWeekDates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Select date".tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.brightnessOf(context) == Brightness.dark
                  ? AppColors.darkTextSecondary
                  : AppColors.black,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (_selectedIndex == 0) return;
                setState(() {
                  _selectedIndex--;
                });
                widget.onDateSelected(dates[_selectedIndex]);
                scrollToIndex(_selectedIndex);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Expanded(
              child: SizedBox(
                height: 75.h,
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (_, _) => SizedBox(width: 10.w),
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
                                  setState(() => _selectedIndex = index);
                                  widget.onDateSelected(dates[index]);
                                }
                              },
                              child: DateItem(
                                isSelected: index == _selectedIndex,
                                dayName: DateFormat('EEE').format(dates[index]),
                                dayNumber: DateFormat(
                                  'dd',
                                ).format(dates[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                  itemCount: dates.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (_selectedIndex == dates.length - 1) return;
                setState(() {
                  _selectedIndex++;
                });
                widget.onDateSelected(dates[_selectedIndex]);
                scrollToIndex(_selectedIndex);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
