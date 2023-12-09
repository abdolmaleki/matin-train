import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';
import 'package:team_project/core/utils/helper/date_time.dart';

class WeekdayRowWidget extends StatelessWidget {
  const WeekdayRowWidget(
      {super.key, required this.selected, required this.dateTime});

  final bool selected;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? AppColors.primary : AppColors.white,
          border: selected
              ? null
              : Border.all(color: AppColors.primaryLighter, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppDateTimeHelper.formatDateTime(dateTime: dateTime, format: "d"),
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: selected ? Colors.white : AppColors.primary),
          ),
          Text(
            AppDateTimeHelper.formatDateTime(dateTime: dateTime, format: "EEE"),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: selected ? Colors.white : AppColors.primary),
          )
        ],
      ),
    );
  }
}
