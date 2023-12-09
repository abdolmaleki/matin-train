import 'package:flutter/material.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    helpText: "SELECT TIME",
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: AppTypography.buttonMedium),
          ),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        ),
      );
    },
  );

  return selectedTime;
}
