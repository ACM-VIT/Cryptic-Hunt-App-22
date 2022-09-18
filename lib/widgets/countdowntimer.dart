import 'timedisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? countDown;
  Duration myDuration = const Duration(seconds: 0);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    myDuration = DateTime(2022, 9, 15, 8).difference(DateTime.now());
    countDown =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    setState(() {
      final secondsRemaining = myDuration.inSeconds - 1;
      myDuration = Duration(seconds: secondsRemaining);
    });
  }

  @override
  Widget build(BuildContext context) {
    int hours = myDuration.inHours;
    int minutes = myDuration.inMinutes.remainder(60);
    int seconds = myDuration.inSeconds.remainder(60);
    // print("$hours:$minutes:$seconds");
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 244, 234, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Cryptic Hunt",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset('Owl-7.svg')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Phase 1",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.orange))),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Text(
                  "Tick! Tock!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeDisplay(hours),
                  const Text(
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                    ":",
                  ),
                  TimeDisplay(minutes),
                  const Text(
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                    ":",
                  ),
                  TimeDisplay(seconds),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
