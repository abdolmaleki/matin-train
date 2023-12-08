import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/themes/typography.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

Future<DateTime?> showCustomDatePicker(BuildContext context) async {
  final DateTime? selectedDate = await showDatePicker(
      context: context,
      helpText: "SELECT DATE",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  textStyle: AppTypography.buttonMedium),
            ),


          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1, 1),
      lastDate: DateTime(2040, 1, 31));

  return selectedDate;
}
