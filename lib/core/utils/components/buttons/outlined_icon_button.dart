import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/buttons/enums/button_size.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  const CustomOutlinedIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.buttonSize = ButtonSize.medium});

  final Function()? onPressed;
  final Widget icon;
  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
                width: 1,
                color: AppColors.gray500.withOpacity(0.24),
                style: BorderStyle.solid);
          } else if (states.contains(MaterialState.pressed)) {
            return BorderSide(
                width: 1,
                color: AppColors.primary.withOpacity(0.48),
                style: BorderStyle.solid);
          }
          return BorderSide(
              width: 1,
              color: Theme.of(context).disabledColor.withOpacity(0.32),
              style: BorderStyle.solid);
        }),
      ))),
      child: Container(
          alignment: Alignment.center,
          width: _getButtonSize(),
          height: _getButtonSize(),
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(width: 20, height: 20, child: icon),
          )),
    );
  }

  double _getButtonSize(){
    switch(buttonSize){
      case ButtonSize.small:
        return 30;
      case ButtonSize.medium:
        return 36;
      case ButtonSize.large:
        return 40;
    }
  }
}
