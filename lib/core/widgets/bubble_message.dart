import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BubbleMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final bool isTyping;
  const BubbleMessage({
    super.key,
    required this.message,
    required this.isMe,
    this.isTyping = false,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
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
            child: isTyping
                ? const _TypingDots()
                : Text(
                    message,
                    softWrap: true,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 15,
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => __TypingDotsState();
}

class __TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _dotAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
    _dotAnimation = IntTween(begin: 1, end: 3).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotAnimation,
      builder: (_, _) {
        final dots = '.' * _dotAnimation.value;
        return Text(
          dots,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        );
      },
    );
  }
}
