import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'or',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Theme.of(context).secondaryHeaderColor),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
