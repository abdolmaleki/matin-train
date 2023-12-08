extension DateTimeExtension on DateTime {
  bool isEqualOrAfter(DateTime date) {
    DateTime dateToCompare = DateTime(date.year, date.month, date.day);
    DateTime currentDate = DateTime(year, month, day);
    return dateToCompare.isAtSameMomentAs(currentDate) ||
        currentDate.isAfter(dateToCompare);
  }

  bool isEqualOrBefore(DateTime date) {
    DateTime dateToCompare = DateTime(date.year, date.month, date.day);
    DateTime currentDate = DateTime(year, month, day);
    return dateToCompare.isAtSameMomentAs(currentDate) ||
        currentDate.isBefore(dateToCompare);
  }

  bool isEqual(DateTime date) {
    DateTime dateToCompare = DateTime(date.year, date.month, date.day);
    DateTime currentDate = DateTime(year, month, day);
    return dateToCompare.isAtSameMomentAs(currentDate);
  }

  bool isNotEqual(DateTime date) {
    DateTime dateToCompare = DateTime(date.year, date.month, date.day);
    DateTime currentDate = DateTime(year, month, day);
    return !dateToCompare.isAtSameMomentAs(currentDate);
  }
}
