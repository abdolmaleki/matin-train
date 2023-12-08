import 'package:flutter/material.dart';

class CustomStepContent extends InheritedWidget {
  final Function(bool) readyToSubmit;

  const CustomStepContent({
    required this.readyToSubmit,
    required Widget child,
    super.key,
  }) : super(child: child);

  static CustomStepContent of(BuildContext context) {
    final CustomStepContent? result = maybeOf(context);
    assert(result != null, 'No CustomStepContent found in context');
    return result!;
  }

  static CustomStepContent? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomStepContent>();
  }

  @override
  bool updateShouldNotify(CustomStepContent oldWidget) =>
      readyToSubmit != oldWidget.readyToSubmit;
}
