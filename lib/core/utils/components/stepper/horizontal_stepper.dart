import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/containers/circle_container.dart';
import 'package:team_project/core/utils/components/stepper/enum.dart';
import 'package:team_project/core/utils/components/stepper/stepper_content.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

double stepWidth = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single)
    .size
    .width;

class CustomHorizontalStepper extends StatefulWidget {
  const CustomHorizontalStepper({
    super.key,
    required this.steps,
    required this.currentStepIndex,
    this.isScrollable = false,
  });

  final List<CustomStep> steps;
  final int currentStepIndex;
  final bool isScrollable;

  @override
  State<CustomHorizontalStepper> createState() =>
      _CustomHorizontalStepperState();
}

class _CustomHorizontalStepperState extends State<CustomHorizontalStepper> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (widget.isScrollable) {
      _scrollToCurrentStep();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 58,
            child: widget.isScrollable
                ? ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      children: widget.steps
                          .asMap()
                          .map((index, step) => MapEntry(
                              index,
                              CustomHorizontalStepperRow(
                                step: widget.steps[index],
                                state: _getState(index),
                                isFirstStep: index == 0,
                                isLastStep: index == widget.steps.length - 1,
                                isScrollable: widget.isScrollable,
                              )))
                          .values
                          .toList(),
                    ),
                  )
                : Row(
                    children: List.generate(
                        widget.steps.length,
                        (index) => CustomHorizontalStepperRow(
                              step: widget.steps[index],
                              state: _getState(index),
                              isFirstStep: index == 0,
                              isLastStep: index == widget.steps.length - 1,
                              isScrollable: widget.isScrollable,
                            )),
                  )),
      ],
    );
  }

  CustomStepState _getState(int index) {
    if (index < widget.currentStepIndex) {
      return CustomStepState.complete;
    } else if (index == widget.currentStepIndex) {
      return CustomStepState.inProgress;
    }
    return CustomStepState.notStarted;
  }

  void _scrollToCurrentStep() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _scrollController.animateTo(
          widget.currentStepIndex * (MediaQuery.of(context).size.width * 0.3),
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease);
    });
  }
}

class CustomHorizontalStepperRow extends StatelessWidget {
  final CustomStep step;
  final CustomStepState state;
  final bool isFirstStep;
  final bool isLastStep;
  final bool isScrollable;

  const CustomHorizontalStepperRow({
    super.key,
    required this.step,
    required this.state,
    required this.isFirstStep,
    required this.isLastStep,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return isScrollable
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: isFirstStep
                            ? const SizedBox()
                            : _getLine(context, _getLeftLineColor(context))),
                    _getStateIcon(context),
                    Expanded(
                        child: isLastStep
                            ? const SizedBox()
                            : _getLine(context, _getRightLineColor(context))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  step.label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: _getTextColor(context)),
                )
              ],
            ),
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: isFirstStep
                            ? const SizedBox()
                            : _getLine(context, _getLeftLineColor(context))),
                    _getStateIcon(context),
                    Expanded(
                        child: isLastStep
                            ? const SizedBox()
                            : _getLine(context, _getRightLineColor(context))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  step.label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: _getTextColor(context)),
                )
              ],
            ),
          );
  }

  Widget _getStateIcon(BuildContext context) {
    switch (state) {
      case CustomStepState.notStarted:
        return Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          child: CustomCircleContainer(
            color: Theme.of(context).disabledColor,
            size: 8,
            padding: EdgeInsets.zero,
          ),
        );
      case CustomStepState.inProgress:
        return Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          child: const CustomCircleContainer(
            color: AppColors.gray800,
            size: 8,
            padding: EdgeInsets.zero,
          ),
        );
      case CustomStepState.complete:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 24,
            height: 24,
            child: AppIcon.checkmark,
          ),
        );
    }
  }

  Widget _getLine(BuildContext context, Color color) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      child: Container(
        height: 2,
        color: color,
      ),
    );
  }

  Color _getLeftLineColor(BuildContext context) {
    switch (state) {
      case CustomStepState.notStarted:
        return Theme.of(context).dividerColor;
      case CustomStepState.complete:
      case CustomStepState.inProgress:
        return Theme.of(context).primaryColor;
    }
  }

  Color _getRightLineColor(BuildContext context) {
    switch (state) {
      case CustomStepState.notStarted:
      case CustomStepState.inProgress:
        return Theme.of(context).dividerColor;
      case CustomStepState.complete:
        return Theme.of(context).primaryColor;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (state) {
      case CustomStepState.notStarted:
        return Theme.of(context).disabledColor;
      case CustomStepState.complete:
      case CustomStepState.inProgress:
        return Theme.of(context).primaryColor;
    }
  }
}

class CustomStep {
  final String label;
  final CustomStepContent content;
  final bool? isReady;

  CustomStep(
      {this.isReady = false, required this.label, required this.content});
}
