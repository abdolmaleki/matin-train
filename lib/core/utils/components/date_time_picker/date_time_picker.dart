import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/date_time_picker/date_picker.dart';
import 'package:hoivalani/core/utils/components/date_time_picker/timer_picker.dart';

Future<DateTime?> showCustomDateTimePicker(BuildContext context) async {
  final DateTime? selectedDate = await showCustomDatePicker(context);
  if (selectedDate != null) {
    if (context.mounted) {
      TimeOfDay? selectedTime = await showCustomTimePicker(context);
      if (selectedTime != null) {
        return DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
      }
    }
  }
  return null;
}
