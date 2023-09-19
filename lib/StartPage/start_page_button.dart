
import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/choose_children/choose_child_profile_main.dart';

import '../player_box.dart';


class AnonButton extends StatelessWidget {
  const AnonButton({Key? key, required this.href, required this.color, required this.text}) : super(key: key);
  final String href;
  final Color color ;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ()  {
          getProgress();
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 2500),
              pageBuilder: (context, animation, secondaryAnimation) => const AnonChildSelector(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          );

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            side: const BorderSide(width: 3, color: Colors.white),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
        child:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Digital',
          ),
        ));
  }
}

