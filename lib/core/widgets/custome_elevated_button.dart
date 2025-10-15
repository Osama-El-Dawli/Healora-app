import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  final String label;
  final String pushedPageRoute;

  const CustomeElevatedButton({
    super.key,
    required this.label,
    required this.pushedPageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, pushedPageRoute);
        },
        child: Text(label),
      ),
    );
  }
}
