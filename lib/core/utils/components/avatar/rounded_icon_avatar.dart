import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomRoundedIconAvatar extends StatelessWidget {
  const CustomRoundedIconAvatar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.primary,
      ),
      child: SizedBox(
        width: 16,
        height: 16,
        child: child,
      ),
    );
  }
}
