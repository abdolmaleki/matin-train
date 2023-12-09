import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/dimensions/spaces.dart';

class CustomDetailsTable extends StatelessWidget {
  const CustomDetailsTable({super.key, required this.items});

  final List<CustomDetailItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => items[index],
      itemCount: items.length,
      shrinkWrap: true,
      primary: false,
    );
  }
}

class CustomDetailItem extends StatelessWidget {
  const CustomDetailItem(
      {super.key,
      required this.label,
      this.type = DetailsType.row,
      required this.value});

  final String label;
  final DetailsType type;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        if (type == DetailsType.row)
          Padding(
            padding: const EdgeInsets.only(right: screenHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall,
                ),
                (value is String)
                    ? Text(
                        value,
                        style: theme.textTheme.bodySmall!
                            .apply(color: theme.secondaryHeaderColor),
                      )
                    : value
              ],
            ),
          ),
        if (type == DetailsType.column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall,
              ),
              (value is String)
                  ? Text(
                      value,
                      style: theme.textTheme.bodySmall!
                          .apply(color: theme.secondaryHeaderColor),
                    )
                  : value
            ],
          ),
        const SizedBox(
          height: 8,
        ),
        const Divider()
      ],
    );
  }
}

enum DetailsType { column, row }
