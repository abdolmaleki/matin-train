import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbVisibility: true,
      //always show scrollbar
      thickness: 4,
      
      thumbColor: AppColors.gray600.withOpacity(.48),
      //width of scrollbar
      radius: const Radius.circular(12),
      //corner radius of scrollbar
      scrollbarOrientation: ScrollbarOrientation.right,
      child: child,
    );
  }
}
