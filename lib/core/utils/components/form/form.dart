import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(
      {super.key, required this.child, required this.formKey, this.onChanged});

  final Widget child;
  final GlobalKey formKey;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: onChanged,
      child: child,
    );
  }
}
