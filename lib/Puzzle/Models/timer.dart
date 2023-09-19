
import 'package:flutter/material.dart';

class GameTimer extends StatefulWidget {
  GameTimer({super.key, Key? key1, required int time}) {
    _timer = time;
  }
  late final int _timer;

  @override
  State<GameTimer> createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 40,
            width: 100,
            color: Colors.transparent,
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            height: 20,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                widget._timer.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Digital',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(

          left: 50,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
