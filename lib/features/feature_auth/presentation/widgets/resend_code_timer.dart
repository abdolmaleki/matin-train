import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/buttons/text_button.dart';
import 'package:team_project/core/utils/custom_widgets/timer_widget.dart';

class ResendCodeTimerWidget extends StatefulWidget {
  const ResendCodeTimerWidget({super.key});

  @override
  State<ResendCodeTimerWidget> createState() => _ResendCodeTimerWidgetState();
}

class _ResendCodeTimerWidgetState extends State<ResendCodeTimerWidget> {
  bool? showTimer;

  @override
  void initState() {
    super.initState();
    showTimer = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: showTimer!
          ? [
              Text(
                "selectLanguage",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                width: 8,
              ),
              TimerWidget(
                  key: GlobalKey(),
                  durationInMinutes: 1,
                  onCompleted: () {
                    setState(() {
                      showTimer = false;
                    });
                  }),
            ]
          : [
              Text(
                "Didn't Receive a Code?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                width: 4,
              ),
              CustomTextButton(
                  label: "Send Code Again",
                  onPressed: () {
                    setState(() {
                      showTimer = true;
                    });
                  },
                  buttonSize: ButtonSize.small)
            ],
    );
  }
}
