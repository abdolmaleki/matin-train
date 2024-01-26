import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/drop_down/drop_down_item.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomDropDownTag extends StatelessWidget {
  const CustomDropDownTag(
      {super.key, required this.item, required this.onRemoved});

  final CustomDropDownItem item;
  final Function(CustomDropDownItem) onRemoved;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray500.withOpacity(0.16),
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Text(
              item.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
            },
          ),
          const SizedBox(width: 4.0),
          InkWell(
            child: AppIcon.remove,
            onTap: () {
              onRemoved.call(item);
            },
          )
        ],
      ),
    );
  }
}