import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class DoctorMessage extends StatelessWidget {
  final String message;
  final int index;
  const DoctorMessage({super.key, required this.message, required this.index});
  @override
  Widget build(BuildContext context) {
    bool iseven = index % 2 == 0;
    return Row(
      mainAxisAlignment: iseven
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: iseven
              ? BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                )
              : BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 15,
              color: iseven ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
