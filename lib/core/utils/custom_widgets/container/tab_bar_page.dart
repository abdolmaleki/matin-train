import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/tabbar/fix_tabbar.dart';
import 'package:hoivalani/core/utils/custom_widgets/text/page_title.dart';

class CustomTabBarPage extends StatefulWidget {
  const CustomTabBarPage(
      {super.key,
      required this.titles,
      required this.tabViews,
      required this.tabs});

  final List<String> titles;
  final List<Widget> tabViews;
  final List<Widget> tabs;

  @override
  State<CustomTabBarPage> createState() => _CustomTabBarPageState();
}

class _CustomTabBarPageState extends State<CustomTabBarPage> {
  late String _pageTitle;

  @override
  void initState() {
    _pageTitle = widget.titles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPageTitleWidget(title: _pageTitle),
        const SizedBox(
          height: 22,
        ),
        Expanded(
            child: CustomFixTabBar(
          length: widget.titles.length,
          tabs: widget.tabs,
          tabViews: widget.tabViews,
          isScrollable: false,
          onChanged: (index) {
            setState(() {
              _pageTitle = widget.titles[index];
            });
          },
        )),
      ],
    );
  }
}
