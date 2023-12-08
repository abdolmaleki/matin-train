import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key,
      this.value,
      this.groupValue,
      this.onChanged,
      required this.label,
      this.suffix});

  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final String label;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged!.call(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (suffix != null)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: suffix,
              ),
            )
        ],
      ),
    );
  }
}
