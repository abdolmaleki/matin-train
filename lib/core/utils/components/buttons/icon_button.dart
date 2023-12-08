import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/color/solid_filter.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.size, required this.icon,this.shape});

  final IconButtonSize size;
  final Widget icon;
  final IconButtonShape? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: _getSize(),
      height: _getSize(),
      decoration: BoxDecoration(
        borderRadius: (shape!=null || shape==IconButtonShape.square)?BorderRadius.circular(4):null,
          shape: (shape==null || shape==IconButtonShape.circle)?BoxShape.circle:BoxShape.rectangle,
          color: (shape==null || shape==IconButtonShape.circle)?Theme.of(context).colorScheme.background:Colors.white),
      child: SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CustomSolidFilterColor(color: (shape==null || shape==IconButtonShape.circle)?AppColors.gray600:AppColors.gray800, child: icon),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case IconButtonSize.small:
        return 18;
      case IconButtonSize.medium:
        return 24;
      case IconButtonSize.large:
        return (shape==null || shape==IconButtonShape.circle)?32:16;
      case IconButtonSize.xLarge:
        return 40;
    }
  }

  double _getIconSize() {
    switch (size) {
      case IconButtonSize.small:
        return 9;
      case IconButtonSize.medium:
        return 12;
      case IconButtonSize.large:
        return 16;
      case IconButtonSize.xLarge:
        return 20;
    }
  }
}

enum IconButtonSize { small, medium, large, xLarge }

enum IconButtonShape { circle, square }
