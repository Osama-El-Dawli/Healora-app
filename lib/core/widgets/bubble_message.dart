import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BubbleMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  const BubbleMessage({super.key, required this.message, required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: isMe
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
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
