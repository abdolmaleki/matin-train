import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomFixTabBar extends StatefulWidget {
  const CustomFixTabBar(
      {super.key,
      required this.length,
      required this.tabs,
      required this.tabViews,
      this.isScrollable = false,
      this.tabBarPadding,
      this.onChanged});

  final int length;
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final bool isScrollable;
  final EdgeInsets? tabBarPadding;
  final Function(int)? onChanged;

  @override
  State<CustomFixTabBar> createState() => _CustomFixTabBarState();
}

class _CustomFixTabBarState extends State<CustomFixTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.length, vsync: this);
    _addTabListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
              dividerColor: AppColors.gray600,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.only(bottom: 8))),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: Padding(
              padding: widget.tabBarPadding ?? EdgeInsets.zero,
              child: TabBar(
                isScrollable: widget.isScrollable,
                tabs: widget.tabs,
                controller: _tabController,
                labelPadding: widget.isScrollable
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _addTabListener() {
    _tabController!.addListener(() {
      if (!_tabController!.indexIsChanging) {
        if (widget.onChanged != null) {
          widget.onChanged!.call(_tabController!.index);
        }
      }
    });
  }
}
