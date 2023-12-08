import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/themes/typography.dart';
import 'package:hoivalani/core/utils/components/buttons/enums/button_color.dart';
import 'package:hoivalani/core/utils/components/buttons/enums/button_size.dart';
import 'package:hoivalani/core/utils/components/color/solid_filter.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {required this.label,
      required this.onPressed,
      Key? key,
      this.disabled = false,
      required this.buttonSize,
      this.isExpanded = false,
      this.buttonColor = ButtonColor.primary,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  final String label;
  final Function() onPressed;
  final bool disabled;
  final ButtonSize buttonSize;
  final bool isExpanded;
  final ButtonColor buttonColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: _getButtonHeight(),
      child: OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
              padding: _getPadding(),
              foregroundColor: (buttonColor == ButtonColor.primary)
                  ? null
                  : _getForegroundColor(),
              side: (buttonColor == ButtonColor.primary)
                  ? null
                  : BorderSide(
                      width: 1,
                      color: _getBorderColor(),
                      style: BorderStyle.solid)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: CustomSolidFilterColor(color: _getForegroundColor(),
                    child: prefixIcon!),
                  ),
                ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: _getTextStyle(),
              ),
              if (suffixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                      width: _getIconSize(),
                      height: _getIconSize(),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              _getForegroundColor(), BlendMode.srcIn),
                          child: suffixIcon)),
                ),
            ],
          )),
    );
  }

  TextStyle _getTextStyle() {
    switch (buttonSize) {
      case ButtonSize.small:
        return AppTypography.buttonSmall;
      case ButtonSize.medium:
        return AppTypography.buttonMedium;
      case ButtonSize.large:
        return AppTypography.buttonLarge;
    }
  }

  double _getButtonHeight() {
    switch (buttonSize) {
      case ButtonSize.small:
        return 30;
      case ButtonSize.medium:
        return 36;
      case ButtonSize.large:
        return 48;
    }
  }

  double _getIconSize() {
    switch (buttonSize) {
      case ButtonSize.small:
        return 18;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
    }
  }

  EdgeInsets _getPadding() {
    switch (buttonSize) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 4, horizontal: 10);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 6, horizontal: 16);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 11, horizontal: 22);
    }
  }

  Color _getForegroundColor() {
    switch (buttonColor) {
      case ButtonColor.red:
        return AppColors.error;
      case ButtonColor.blue:
        return AppColors.info;
      case ButtonColor.yellow:
        return AppColors.warning;
      case ButtonColor.green:
        return AppColors.success;
      case ButtonColor.primary:
        return AppColors.primary;
      case ButtonColor.defaults:
        return AppColors.gray800;
    }
  }

  Color _getBorderColor() {
    switch (buttonColor) {
      case ButtonColor.red:
        return AppColors.error.withOpacity(0.48);
      case ButtonColor.blue:
        return AppColors.info.withOpacity(0.48);
      case ButtonColor.yellow:
        return AppColors.warning.withOpacity(0.48);
      case ButtonColor.green:
        return AppColors.success.withOpacity(0.48);
      case ButtonColor.primary:
        return AppColors.primary.withOpacity(0.48);
      case ButtonColor.defaults:
        return AppColors.gray500.withOpacity(0.32);
    }
  }
}
