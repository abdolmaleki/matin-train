import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/color/solid_filter.dart';
import 'package:hoivalani/core/utils/components/containers/expandable.dart';
import 'package:hoivalani/core/utils/components/drop_down/drop_down_item.dart';
import 'package:hoivalani/core/utils/components/drop_down/enum.dart';
import 'package:hoivalani/core/utils/components/images/circle_avatar.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomMenuListItem extends StatelessWidget {
  const CustomMenuListItem(
      {super.key,
      required this.item,
      required this.onSelected,
      required this.dropDownType,
      required this.itemHeight});

  final CustomDropDownItem item;
  final Function(CustomDropDownItem) onSelected;
  final DropDownType dropDownType;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return (item.children == null)
        ? CustomFixMenuItem(
            item: item,
            onSelected: (item) {
              onSelected.call(item);
            },
            dropDownType: dropDownType,
            itemHeight: itemHeight,
          )
        : CustomExpandableMenuItem(
            item: item,
            onSelected: (item) {
              onSelected.call(item);
            },
            dropDownType: dropDownType,
            itemHeight: itemHeight,
          );
  }
}

class CustomFixMenuItem extends StatelessWidget {
  const CustomFixMenuItem(
      {super.key,
      required this.item,
      required this.onSelected,
      required this.dropDownType,
      required this.itemHeight});

  final DropDownType dropDownType;
  final double itemHeight;
  final CustomDropDownItem item;
  final Function(CustomDropDownItem) onSelected;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (item.children == null)
        ? GestureDetector(
            onTap: () => onSelected.call(item),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: itemHeight,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                children: [
                  _buildLeading(),
                  Text(
                    item.label,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildLeading() {
    switch (dropDownType) {
      case DropDownType.text:
      case DropDownType.icon:
        return const SizedBox();
      case DropDownType.badge:
        return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: item.leading as Widget);
      case DropDownType.avatar:
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child:
              CustomCircleAvatar(size: 40, imageUrl: item.leading!.toString()),
        );
    }
  }
}

// class CustomFixMenuItem extends StatelessWidget {
//   const CustomFixMenuItem(
//       {super.key, required this.item, required this.onSelected});
//
//   final CustomDropDownItem item;
//   final Function(CustomDropDownItem) onSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//
//     return GestureDetector(
//       onTap: () => onSelected.call(item),
//       child: Container(
//         width: double.infinity,
//         color: Colors.white,
//         height: 34,
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//         child: Text(
//           item.label,
//           style: theme.textTheme.bodyMedium,
//         ),
//       ),
//     );
//   }
// }

class CustomExpandableMenuItem extends StatefulWidget {
  const CustomExpandableMenuItem(
      {super.key,
      required this.item,
      required this.onSelected,
      required this.dropDownType,
      required this.itemHeight});

  final CustomDropDownItem item;
  final Function(CustomDropDownItem) onSelected;
  final DropDownType dropDownType;
  final double itemHeight;

  @override
  State<CustomExpandableMenuItem> createState() =>
      _CustomExpandableMenuItemState();
}

class _CustomExpandableMenuItemState extends State<CustomExpandableMenuItem> {
  final ExpandableController _expandableController = ExpandableController();
  bool _isExpanded = false;

  @override
  void initState() {
    _addExpandableListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          listTileTheme: const ListTileThemeData(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              horizontalTitleGap: 0,
              minLeadingWidth: 0,
              titleAlignment: ListTileTitleAlignment.top)),
      child: CustomExpandablePanel(
        controller: _expandableController,
        header: Container(
            width: double.infinity,
            color: Colors.white,
            height: 34,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: _isExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      CustomSolidFilterColor(
                        color: AppColors.gray800,
                        child: SizedBox(
                          width: 14,
                          height: 14,
                          child: AppIcon.chevronLeft,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        widget.item.label,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item.label,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustomSolidFilterColor(
                          color: AppColors.gray800,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: AppIcon.chevronRight,
                          ))
                    ],
                  )),
        expanded: Column(
          children: widget.item.children!
              .map((item) => CustomFixMenuItem(
                    item: item,
                    onSelected: (item) {
                      widget.onSelected.call(item);
                    },
                    dropDownType: widget.dropDownType,
                    itemHeight: widget.itemHeight,
                  ))
              .toList(),
        ),
        collapsed: const SizedBox(),
        theme: const ExpandableThemeData(
          hasIcon: false,
        ),
      ),
    );
  }

  void _addExpandableListener() {
    _expandableController.addListener(() {
      setState(() {
        _isExpanded = _expandableController.expanded;
      });
    });
  }
}
