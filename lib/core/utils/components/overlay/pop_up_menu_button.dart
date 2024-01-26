import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/color/solid_filter.dart';

class CustomPopupMenuButton extends StatefulWidget {
  const CustomPopupMenuButton(
      {super.key,
      required this.items,
      required this.onSelected,
      required this.icon});

  final List<CustomPopupMenuItem> items;
  final Function(int) onSelected;
  final Widget icon;

  @override
  State<CustomPopupMenuButton> createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      elevation: 1,
      itemBuilder: (BuildContext context) => widget.items
          .asMap()
          .map((index, value) => MapEntry(
              index,
              PopupMenuItem<int>(
                onTap: () => widget.onSelected.call(index),
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 16),
                value: index,
                child: Row(
                  children: [
                    CustomSolidFilterColor(
                        color: Theme.of(context).secondaryHeaderColor,
                        child: SizedBox( width: 24,
                            height: 24,child: value.icon)),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      value.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              )))
          .values
          .toList(),
      child: widget.icon,
    );
  }
}

class CustomPopupMenuItem {
  final String text;
  final Widget icon;

  CustomPopupMenuItem({required this.text, required this.icon});
}
