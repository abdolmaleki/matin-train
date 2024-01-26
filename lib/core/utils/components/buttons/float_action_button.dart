import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton(
      {super.key, required this.icon, required this.onPressed, this.color});

  final Widget icon;
  final Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          backgroundColor: color??AppColors.primary,
          child: icon,
        ),
      ),
    );
  }
}
