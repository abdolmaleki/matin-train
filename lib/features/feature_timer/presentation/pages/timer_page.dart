import 'dart:async';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHour = '00';
  Timer? _timer;
  List laps = [];
  bool started = false;

  void _stop() {
    _timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void _reset() {
    _timer!.cancel();
    laps.clear();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;
      digitSeconds = '00';
      digitMinutes = '00';
      digitHour = '00';
      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHour:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void _start() {
    started = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1, localMinutes = minutes, localHour = hours;
      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHour++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHour;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHour = (seconds >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Stop Watch App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
             Text(
              '$digitHour:$digitMinutes:$digitSeconds',
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.deepPurpleAccent),
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'lap n${index + 1}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        '${laps[index]}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  );
                },
                itemCount: laps.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      (!started)?_start():_stop();
                    },
                    child: Text((!started)?"Start":"Pause"),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: const Icon(Icons.flag),
                    color: Colors.white,
                    onPressed: () {
                      addLaps();
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      _reset();
                    },
                    child: const Text('reset'),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
