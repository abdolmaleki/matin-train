import 'package:flutter/material.dart';

class CustomSolidFilterColor extends StatelessWidget {
  const CustomSolidFilterColor(
      {super.key, required this.child, required this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: child,
    );
  }
}
