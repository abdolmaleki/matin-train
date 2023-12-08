import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget(
      {required this.durationInMinutes, Key? key, required this.onCompleted})
      : super(key: key);

  final double durationInMinutes;
  final Function() onCompleted;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  double? _totalSeconds;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.durationInMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_totalSeconds == 0) {
          setState(() {
            timer.cancel();
            widget.onCompleted.call();
          });
        } else {
          setState(() {
            _totalSeconds = _totalSeconds! - 1;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_getRemainedMinutes()}:${_getRemainedSeconds()}",
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  String _getRemainedSeconds() {
    return ((_totalSeconds! % 60).floor()).toString().padLeft(2, '0');
  }

  String _getRemainedMinutes() {
    return ((_totalSeconds! / 60).floor()).toString().padLeft(2, '0');
  }
}
