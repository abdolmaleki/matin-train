import 'package:flutter/material.dart';
import 'package:hoivalani/features/feature_cycle/presentation/widgets/common/weekday_list/weekday_row.dart';

class WeekdayListWidget extends StatefulWidget {
  const WeekdayListWidget(
      {super.key, required this.scrollController, required this.onSelected});

  final ScrollController scrollController;
  final Function(DateTime) onSelected;

  @override
  State<WeekdayListWidget> createState() => _WeekdayListWidgetState();
}

class _WeekdayListWidgetState extends State<WeekdayListWidget> {
  int selectedIndex = 0;
  final List<DateTime> _dates = [];

  @override
  void initState() {
    _makeWeeks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 97,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 8,
                child: Container(
                  width: 20,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 5,
                        offset: Offset(1, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 17,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 0,
                top: 80,
                child: Container(
                  width: 20,
                  height: 17,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 52,
            child: ListView.builder(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() {
                  selectedIndex = index;
                  widget.onSelected.call(_dates[index]);
                }),
                child: WeekdayRowWidget(
                  selected: index == selectedIndex,
                  dateTime: _dates[index],
                ),
              ),
              itemCount: 20,
            ),
          ),
        ),
        SizedBox(
          width: 20,
          height: 97,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 8,
                child: Container(
                  width: 20,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 5,
                        offset: Offset(-1, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 17,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                right: 0,
                top: 80,
                child: Container(
                  width: 20,
                  height: 17,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _makeWeeks() {
    for (int i = 0; i < 21; i++) {
      _dates.add(DateTime.now().add(Duration(days: i)));
    }
  }
}
