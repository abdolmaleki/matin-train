import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_color.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton(
      {required this.label,
      required this.onPressed,
      Key? key,
      this.disabled = false,
      required this.buttonSize,
      this.isExpanded = true,
      this.buttonColor = ButtonColor.primary,
      this.prefixIcon,
      this.suffixIcon,
      this.isLoading = false})
      : super(key: key);

  final String label;
  final Function() onPressed;
  final bool disabled;
  final ButtonSize buttonSize;
  final bool isExpanded;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ButtonColor buttonColor;
  final bool isLoading;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  MaterialStatesController controller = MaterialStatesController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getButtonHeight(),
      width: widget.isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed:
            (widget.disabled || widget.isLoading) ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
            padding: _getPadding(),
            backgroundColor: _getBackgroundColor(),
            foregroundColor: _getForegroundColor()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            _getForegroundColor(), BlendMode.srcIn),
                        child: widget.prefixIcon)),
              ),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: _getTextStyle(),
            ),
            if (widget.isLoading)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: CupertinoActivityIndicator(
                      color: _getForegroundColor(),
                    )),
              ),
            if (widget.suffixIcon != null && !widget.isLoading)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            _getForegroundColor(), BlendMode.srcIn),
                        child: widget.suffixIcon)),
              ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    switch (widget.buttonSize) {
      case ButtonSize.small:
        return AppTypography.buttonSmall;
      case ButtonSize.medium:
        return AppTypography.buttonMedium;
      case ButtonSize.large:
        return AppTypography.buttonLarge;
    }
  }

  double _getButtonHeight() {
    switch (widget.buttonSize) {
      case ButtonSize.small:
        return 30;
      case ButtonSize.medium:
        return 36;
      case ButtonSize.large:
        return 48;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.buttonSize) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 4, horizontal: 10);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 6, horizontal: 16);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 11, horizontal: 22);
    }
  }

  double _getIconSize() {
    switch (widget.buttonSize) {
      case ButtonSize.small:
        return 18;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
    }
  }

  Color _getBackgroundColor() {
    switch (widget.buttonColor) {
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
        return AppColors.gray300;
    }
  }

  Color _getForegroundColor() {
    if (widget.disabled || widget.isLoading) {
      return AppColors.gray500;
    }
    switch (widget.buttonColor) {
      case ButtonColor.red:
      case ButtonColor.blue:
      case ButtonColor.primary:
        return Colors.white;
      case ButtonColor.green:
      case ButtonColor.yellow:
      case ButtonColor.defaults:
        return AppColors.gray800;
    }
  }
}
