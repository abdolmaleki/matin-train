import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateTimeHelper {
  static String formatDateTime(
      {required DateTime dateTime, required String format}) {
    String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }

  static String todayOrDate({required DateTime dateTime}) {
    if (dateTime.day == DateTime.now().day) {
      return "Today ${DateFormat("hh:mm a").format(dateTime)}";
    } else {
      return DateFormat("MMM d, hh:mm a").format(dateTime);
    }
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String convertTimeToString(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")} ${time.period.name.toUpperCase()}";
  }

  static DateTime convertStringToDateTime(
      {required String date, required String format}) {
    return DateFormat(format).parse(date);
  }

  static DateTime getFirstDayOfWeek(DateTime now) {
    return getDate(now.subtract(Duration(days: now.weekday - 1)));
  }

  static DateTime getLastDayOfWeek(DateTime now) {
    return getDate(now.add(Duration(days: DateTime.daysPerWeek - now.weekday)));
  }

  static DateTime getFirstDayOfMonth(DateTime now) {
    int currentMonth = now.month;
    return DateTime(now.year, currentMonth, 1);
  }

  static DateTime getLastDayOfMonth(DateTime now) {
    int currentMonth = now.month;
    int lastDay = DateTime(now.year, now.month + 1, 0).day;
    return DateTime(now.year, currentMonth, lastDay);
  }


  static DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
}
