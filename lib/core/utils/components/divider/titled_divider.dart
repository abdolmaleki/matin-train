import 'package:flutter/material.dart';

class CustomTitledDivider extends StatelessWidget {
  const CustomTitledDivider(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall!.apply(color: Theme.of(context).secondaryHeaderColor),
        ),
        const SizedBox(
          width: 4,
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}
