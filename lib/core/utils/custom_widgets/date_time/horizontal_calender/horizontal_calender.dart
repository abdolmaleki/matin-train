import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/buttons/toggle_button.dart';
import 'package:team_project/core/utils/constants/dimensions/spaces.dart';
import 'package:team_project/core/utils/custom_widgets/date_time/horizontal_calender/weekday_list.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  const CustomHorizontalCalendar({super.key, required this.onSelected});
  final Function(DateTime) onSelected;

  @override
  State<CustomHorizontalCalendar> createState() => _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {

  final ScrollController _weeksScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "01 Feb - 07 Aug - Week 01",
                style: Theme.of(context).textTheme.bodySmall!,
              ),
              CustomOutlineToggleButton(
                items: ["Week 1", "Week 2", "Week 3"],
                onPressed: (index) {
                  _scrollToWeek(index);
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        WeekdayListWidget(
          scrollController: _weeksScrollController,
          onSelected: (dateTime){
            widget.onSelected.call(dateTime);
          },
        ),
      ],
    );
  }

  void _scrollToWeek(int index) {
    double itemWidth = 48;
    _weeksScrollController.animateTo(
      (index * 7) * itemWidth,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
