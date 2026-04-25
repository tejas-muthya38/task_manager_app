import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int seconds = 1500;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      }
    });
  }

  void reset() {
    timer?.cancel();
    setState(() => seconds = 1500);
  }

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Column(
            children: [
              Text(
                "$minutes:${secs.toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: startTimer, child: Text("Start")),
                  SizedBox(width: 12),
                  ElevatedButton(onPressed: reset, child: Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
