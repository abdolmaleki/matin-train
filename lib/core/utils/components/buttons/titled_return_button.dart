import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/themes/typography.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';

class LabeledReturnButton extends StatelessWidget {
  const LabeledReturnButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>context.router.pop(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon.chevronLeft,
          const SizedBox(width: 14,),
          Text(
            label,
            style: AppTypography.buttonSmall,
          )
        ],
      ),
    );
  }
}
