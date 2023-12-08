import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

import 'package:hoivalani/core/utils/components/labels/enum.dart';

class CustomGhostLabel extends StatelessWidget {
  const CustomGhostLabel(
      {super.key,
      required this.text,
      required this.labelType,
      this.prefixIcon,
      this.suffixIcon});

  final String text;
  final LabelType labelType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: _getBackgroundColor()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: prefixIcon!,
            ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: _getTextColor()),
          ),
          if (suffixIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: suffixIcon!,
            ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (labelType) {
      case LabelType.primary:
        return AppColors.primary.withOpacity(0.16);
      case LabelType.secondary:
        return AppColors.gray500.withOpacity(0.16);
      case LabelType.red:
        return AppColors.error.withOpacity(0.16);
      case LabelType.green:
        return AppColors.success.withOpacity(0.16);
      case LabelType.yellow:
        return AppColors.warning.withOpacity(0.16);
      case LabelType.blue:
        return AppColors.info.withOpacity(0.16);
    }
  }

  Color _getTextColor() {
    switch (labelType) {
      case LabelType.primary:
        return AppColors.primaryDark;
      case LabelType.secondary:
        return AppColors.gray600;
      case LabelType.red:
        return AppColors.errorDark;
      case LabelType.green:
        return AppColors.successDark;
      case LabelType.yellow:
        return AppColors.warningDark;
      case LabelType.blue:
        return AppColors.infoDark;
    }
  }
}
