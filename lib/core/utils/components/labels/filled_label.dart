import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

import 'package:hoivalani/core/utils/components/labels/enum.dart';

class CustomFilledLabel extends StatelessWidget {
  const CustomFilledLabel(
      {super.key, required this.text, required this.labelType});

  final String text;
  final LabelType labelType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: _getBackgroundColor()),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .apply(color: _getTextColor()),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (labelType) {
      case LabelType.primary:
        return AppColors.primary;
      case LabelType.secondary:
        return AppColors.gray300;
      case LabelType.red:
        return AppColors.error;
      case LabelType.green:
        return AppColors.success;
      case LabelType.yellow:
        return AppColors.warning;
      case LabelType.blue:
        return AppColors.info;
    }
  }

  Color _getTextColor() {
    switch (labelType) {
      case LabelType.primary:
        return AppColors.white;
      case LabelType.secondary:
        return AppColors.gray800;
      case LabelType.red:
        return AppColors.white;
      case LabelType.green:
        return AppColors.gray800;
      case LabelType.yellow:
        return AppColors.gray800;
      case LabelType.blue:
        return AppColors.white;
    }
  }
}
