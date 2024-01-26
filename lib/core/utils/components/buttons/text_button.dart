import 'package:flutter/material.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {required this.label,
      required this.onPressed,
      Key? key,
      this.disabled = false,
      required this.buttonSize})
      : super(key: key);

  final String label;
  final Function() onPressed;
  final bool disabled;
  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: disabled ? null : onPressed,
        child: Text(
          label,
          style: _getTextStyle(),
        ));
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
}
