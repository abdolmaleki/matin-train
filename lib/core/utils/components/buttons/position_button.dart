import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/color/solid_filter.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomPositionButton<T> extends StatefulWidget {
  const CustomPositionButton(
      {super.key,
      required this.firstButton,
      required this.secondButton,
      required this.onSelected});

  final CustomPositionButtonItem firstButton;
  final CustomPositionButtonItem secondButton;
  final Function(T) onSelected;

  @override
  State<CustomPositionButton<T>> createState() => _CustomPositionButtonState();
}

class _CustomPositionButtonState<T> extends State<CustomPositionButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
              child: widget.firstButton,
              onTap: () {
                widget.onSelected.call(widget.firstButton.value);
              }),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: GestureDetector(
              child: widget.secondButton,
              onTap: () {
                widget.onSelected.call(widget.secondButton.value);
              }),
        )
      ],
    );
  }
}

class CustomPositionButtonItem<T> extends StatelessWidget {
  const CustomPositionButtonItem(
      {super.key,
      required this.value,
      required this.label,
      required this.icon,
      required this.groupValue});

  final T value;
  final T groupValue;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    bool selected = (groupValue == value);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.white,
          border: !selected
              ? Border.all(color: AppColors.primaryLighter, width: 1)
              : null,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CustomSolidFilterColor(
                color: selected
                    ? Colors.white
                    : Theme.of(context).secondaryHeaderColor,
                child: icon),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: selected
                      ? Colors.white
                      : Theme.of(context).secondaryHeaderColor,
                ),
          )
        ],
      ),
    );
  }
}
