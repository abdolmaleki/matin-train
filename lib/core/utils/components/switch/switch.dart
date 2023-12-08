import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key,
      this.value = false,
      required this.onChanged,
      required this.width,
      required this.height});

  final bool value;
  final Function(bool) onChanged;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          useMaterial3: false,
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.primary;
              }
              return AppColors.gray100;
            }),
            trackColor: MaterialStateProperty.all(AppColors.gray500),
          )),
      child: Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          onChanged: (newValue) => onChanged.call(newValue)),
    );
  }
}
