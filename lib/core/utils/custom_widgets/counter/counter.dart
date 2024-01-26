import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/color/solid_filter.dart';

class CustomCounterWidget extends StatefulWidget {
  const CustomCounterWidget(
      {super.key,
      this.onSaved,
      required this.initValue,
      this.label,
      this.enable = true});

  final Function(int?)? onSaved;
  final int initValue;
  final String? label;
  final bool enable;

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  late int count;

  @override
  void initState() {
    count = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FormField(
      builder: (state) => AbsorbPointer(
        absorbing: !widget.enable,
        child: Row(
          children: [
            if (widget.label != null)
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Text(
                  widget.label!,
                  style: theme.textTheme.bodyLarge!.apply(
                      color: widget.enable
                          ? theme.primaryColor
                          : theme.disabledColor),
                ),
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.disabledColor, width: 1)),
                child: CustomSolidFilterColor(
                  color:
                      widget.enable ? theme.primaryColor : theme.disabledColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count > 0) {
                                count--;
                              }
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 24,
                          )),
                      Text(
                        count.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.add,
                            size: 24,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!.call(count);
        }
      },
    );
  }
}
