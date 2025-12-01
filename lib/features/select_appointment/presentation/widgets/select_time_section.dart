import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/features/select_appointment/presentation/widgets/time_item.dart';

class SelectTimeSection extends StatefulWidget {
  const SelectTimeSection({
    super.key,
    required this.times,
    required this.onSelect,
  });

  final List<String> times;
  final Function(String) onSelect;

  @override
  State<SelectTimeSection> createState() => _SelectTimeSectionState();
}

class _SelectTimeSectionState extends State<SelectTimeSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemCount: widget.times.length,
        itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 2,
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 100.0,
            child: FadeInAnimation(
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  setState(() => selectedIndex = index);
                  widget.onSelect(widget.times[index]);
                },
                child: TimeItem(
                  isSelected: index == selectedIndex,
                  text: widget.times[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
