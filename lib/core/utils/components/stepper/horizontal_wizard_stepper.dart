import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_color.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/buttons/outlined_button.dart';
import 'package:team_project/core/utils/components/page_view/expandable_page_view.dart';
import 'package:team_project/core/utils/components/stepper/enum.dart';
import 'package:team_project/core/utils/components/stepper/horizontal_stepper.dart';
import 'package:team_project/core/utils/components/stepper/wizard_stepper_controller.dart';
import 'package:team_project/core/utils/helper/platform_helper.dart';

class CustomWizardStepper extends StatefulWidget {
  const CustomWizardStepper(
      {super.key,
      required this.steps,
      required this.lastStepButtonLabel,
      required this.onFinishTaped,
      this.isStepperScrollable = false,
      this.isExpanded = false,
      this.navigationMode = WizardStepperNavigationMode.auto,
      this.onNextTaped,
      this.stepperBackgroundColor,
      this.stepperPadding});

  final List<CustomStep> steps;
  final String lastStepButtonLabel;
  final Function() onFinishTaped;
  final Function(WizardStepperController)? onNextTaped;
  final bool isStepperScrollable;
  final WizardStepperNavigationMode navigationMode;
  final Color? stepperBackgroundColor;
  final EdgeInsets? stepperPadding;

  // Expand height
  final bool isExpanded;

  @override
  State<CustomWizardStepper> createState() => _CustomWizardStepperState();
}

class _CustomWizardStepperState extends State<CustomWizardStepper> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: widget.stepperPadding ?? EdgeInsets.zero,
          alignment: Alignment.center,
          color: widget.stepperBackgroundColor,
          child: CustomHorizontalStepper(
            currentStepIndex: _currentStep,
            steps: widget.steps,
            isScrollable: widget.isStepperScrollable,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        widget.isExpanded
            ? Expanded(
                child: PageView.builder(
                    itemCount: widget.steps.length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: widget.steps[index].content),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: (index == 0)
                                      ? CustomOutlinedButton(
                                          label: "Cancel",
                                          onPressed: () {
                                            _handleLeftButtonClick(index);
                                          },
                                          isExpanded: true,
                                          buttonSize: ButtonSize.medium)
                                      : CustomElevatedButton(
                                          label: "Back",
                                          onPressed: () {
                                            _handleLeftButtonClick(index);
                                          },
                                          isExpanded: true,
                                          buttonColor: ButtonColor.defaults,
                                          prefixIcon: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: AppIcon.arrowLeft),
                                          buttonSize: ButtonSize.medium),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: CustomElevatedButton(
                                      label: _getRightButtonLabel(index),
                                      isExpanded: true,
                                      disabled: !widget.steps[index].isReady!,
                                      buttonColor: ButtonColor.primary,
                                      suffixIcon:
                                          _getRightButtonSuffixIcon(index),
                                      onPressed: () {
                                        _handleRightButtonClick(index);
                                      },
                                      buttonSize: ButtonSize.medium),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ],
                        )),
              )
            : CustomExpandablePageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.steps.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.steps[index].content,
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: (index == 0)
                                  ? CustomOutlinedButton(
                                      label: "Cancel",
                                      onPressed: () {
                                        _handleLeftButtonClick(index);
                                      },
                                      isExpanded: true,
                                      buttonSize: ButtonSize.medium)
                                  : CustomElevatedButton(
                                      label: "Back",
                                      onPressed: () {
                                        _handleLeftButtonClick(index);
                                      },
                                      isExpanded: true,
                                      buttonColor: ButtonColor.defaults,
                                      prefixIcon: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: AppIcon.arrowLeft),
                                      buttonSize: ButtonSize.medium),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                  label: _getRightButtonLabel(index),
                                  isExpanded: true,
                                  disabled: !widget.steps[index].isReady!,
                                  buttonColor: ButtonColor.primary,
                                  suffixIcon: _getRightButtonSuffixIcon(index),
                                  onPressed: () {
                                    _handleRightButtonClick(index);
                                  },
                                  buttonSize: ButtonSize.medium),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    )),
      ],
    );
  }

  void _handleLeftButtonClick(int index) {
    // First Step
    if (index == 0) {
      context.router.pop();
    }
    // Other Steps
    else {
      AppPlatformHelper.dismissKeyboard();
      _pageController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void _handleRightButtonClick(int index) {
    // Last Step
    if (index == widget.steps.length - 1) {
      widget.onFinishTaped.call();
    }
    // Other Steps
    else {
      AppPlatformHelper.dismissKeyboard();
      if (widget.navigationMode == WizardStepperNavigationMode.auto) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        if (widget.onNextTaped != null) {
          widget.onNextTaped!
              .call(WizardStepperController(pageController: _pageController));
        }
      }
    }
  }

  String _getRightButtonLabel(int index) {
    // Last Step
    if (index == widget.steps.length - 1) {
      return widget.lastStepButtonLabel;
    } else {
      return "Next";
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentStep = page;
    });
  }

  Widget? _getRightButtonSuffixIcon(int index) {
    // Last Step
    if (index == widget.steps.length - 1) {
      return null;
    }
    return SizedBox(width: 20, height: 20, child: AppIcon.arrowRight);
  }
}
