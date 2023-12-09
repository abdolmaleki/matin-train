import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomRedBadge extends StatelessWidget {
  const CustomRedBadge({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.error),
    );
  }
}
