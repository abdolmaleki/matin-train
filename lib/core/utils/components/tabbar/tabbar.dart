import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      required this.length,
      required this.tabs,
      required this.tabViews,
      this.isScrollable = true});

  final int length;
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: TabBar(
              labelPadding: isScrollable?const EdgeInsets.symmetric(horizontal: 8):const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 40),
                isScrollable: isScrollable,
                dividerColor: Theme.of(context).dividerColor,
                tabs: tabs),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: TabBarView(
            children: tabViews,
          ))
        ],
      ),
    );
  }
}
