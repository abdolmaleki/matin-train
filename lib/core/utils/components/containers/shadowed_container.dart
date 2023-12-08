import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomShadowedContainer extends StatelessWidget {
  const CustomShadowedContainer(
      {super.key, this.padding, required this.child, this.radius});

  final EdgeInsets? padding;
  final double? radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.only(top: 1),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.gray500.withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 12),
            spreadRadius: -4,
          ),
          BoxShadow(
            color: AppColors.gray500.withOpacity(0.20),
            blurRadius: 2,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
