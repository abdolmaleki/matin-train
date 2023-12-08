import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/components/avatar/enum.dart';
import 'package:hoivalani/core/utils/components/containers/circle_container.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomLetterAvatar extends StatelessWidget {
  const CustomLetterAvatar(
      {super.key, this.color, required this.label, required this.size, this.textColor});

  final Color? color;
  final Color? textColor;
  final String label;
  final LetterAvatarSize size;

  @override
  Widget build(BuildContext context) {
    return CustomCircleContainer(
      color: color ?? AppColors.gray400,
      size: _getSize(),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .apply(color: textColor??Theme.of(context).secondaryHeaderColor),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case LetterAvatarSize.large:
        return 48;
      case LetterAvatarSize.normal:
        return 40;
      case LetterAvatarSize.medium:
        return 32;
      case LetterAvatarSize.small:
        return 24;
    }
  }
}
