import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/themes/typography.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomOutlineToggleButton extends StatefulWidget {
  const CustomOutlineToggleButton({super.key, required this.items, required this.onPressed});

  final List<String> items;
  final Function(int) onPressed;

  @override
  State<CustomOutlineToggleButton> createState() =>
      _CustomOutlineToggleButtonState();
}

class _CustomOutlineToggleButtonState extends State<CustomOutlineToggleButton> {
  List<Widget>? _children;
  List<bool>? _selectedItems;

  @override
  void initState() {
    _makeChildren();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedItems!.length; i++) {
            _selectedItems![i] = i == index;
          }
        });
        widget.onPressed(index);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: AppColors.gray500.withOpacity(0.32),
      fillColor: AppColors.primary.withOpacity(0.08),
      borderColor: AppColors.gray500.withOpacity(0.32),
      constraints: const BoxConstraints(
        minHeight: 36.0,
        minWidth: 51.0,
      ),
      isSelected: _selectedItems!,
      children: _children!,
    );
  }

  void _makeChildren() {
    _children = widget.items
        .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                e,
                style:
                    AppTypography.buttonSmall.apply(color: AppColors.primary),
              ),
            ))
        .toList();

    _selectedItems = widget.items.map((e) => false).toList();
    _selectedItems![0] = true;
  }
}
