import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/progress_bar/enum.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomLinearProgressBar extends StatelessWidget {
  const CustomLinearProgressBar(
      {super.key, required this.color, this.caption, required this.progress});

  final ProgressBarColor color;
  final String? caption;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (caption != null)
          Text(
            caption!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Theme.of(context).secondaryHeaderColor),
          ),
        SizedBox(
          height: 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: _getBackgroundLine(context)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _getForegroundLine(context)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getBackgroundLine(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _getForegroundLine(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraint) => Container(
              width: constraint.maxWidth * progress,
              decoration: BoxDecoration(
                color: _getForegroundColor(),
                borderRadius: BorderRadius.circular(2),
              ),
            ));
  }

  Color _getBackgroundColor() {
    switch (color) {
      case ProgressBarColor.red:
        return AppColors.errorLighter;
      case ProgressBarColor.yellow:
        return AppColors.warningLighter;
      case ProgressBarColor.green:
        return AppColors.successLighter;
    }
  }

  Color _getForegroundColor() {
    switch (color) {
      case ProgressBarColor.red:
        return AppColors.error;
      case ProgressBarColor.yellow:
        return AppColors.warning;
      case ProgressBarColor.green:
        return AppColors.success;
    }
  }
}
