import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Function(bool) onChange;
  final Function(bool)? onSaved;
  final bool isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final Color? borderColor;
  final Widget? checkIcon;
  final String? label;
  final EdgeInsets? padding;
  final Widget? suffix;
  final TextStyle? textStyle;

  const CustomCheckbox(
      {super.key,
      required this.onChange,
      this.isChecked = false,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor,
      this.borderColor,
      this.checkIcon,
      this.label,
      this.padding,
      this.onSaved,
      this.suffix,
      this.textStyle});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (value) {
        widget.onSaved?.call(widget.isChecked);
      },
      builder: (state) => GestureDetector(
        onTap: () => widget.onChange.call(!widget.isChecked),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: widget.padding ?? const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.isChecked
                        ? widget.selectedColor ?? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color:
                          widget.borderColor ?? Theme.of(context).primaryColor,
                      width: 1.5,
                    )),
                width: widget.size ?? 20,
                height: widget.size ?? 20,
                child: widget.isChecked
                    ? (widget.checkIcon ??
                        Icon(
                          Icons.check,
                          color: widget.selectedIconColor ?? Colors.white,
                          size: widget.iconSize ?? 14,
                        ))
                    : null,
              ),
            ),
            if (widget.label != null)
              Text(widget.label!,
                  style: widget.textStyle ??
                      Theme.of(context).textTheme.bodySmall),
            if (widget.suffix != null)
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: widget.suffix,
                ),
              )
          ],
        ),
      ),
    );
  }
}
