import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/color/solid_filter.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomCircleIconAvatar extends StatelessWidget {
  const CustomCircleIconAvatar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray200,
      ),
      child: SizedBox(
        width: 16,
        height: 16,
        child: CustomSolidFilterColor(
            color: Theme.of(context).secondaryHeaderColor, child: child),
      ),
    );
  }
}
