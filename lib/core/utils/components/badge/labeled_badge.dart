import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/badge/enum.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomLabeledBadge extends StatelessWidget {
  const CustomLabeledBadge(
      {super.key, required this.color, required this.label});

  final BadgeColor color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.5),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: _getBadgeColor()),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .apply(color: _getLabelColor()),
      ),
    );
  }

  Color _getBadgeColor() {
    switch (color) {
      case BadgeColor.red:
        return AppColors.error;
      case BadgeColor.green:
        return AppColors.success;
      case BadgeColor.yellow:
        return AppColors.warning;
      case BadgeColor.blue:
        return AppColors.error;
    }
  }

  Color _getLabelColor() {
    switch (color) {
      case BadgeColor.red:
        return Colors.white;
      case BadgeColor.green:
        return AppColors.gray800;
      case BadgeColor.yellow:
        return AppColors.gray800;
      case BadgeColor.blue:
        return Colors.white;
    }
  }
}
