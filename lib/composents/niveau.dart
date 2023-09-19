import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/sort_game/Levels/Level.dart';

class Niveau extends StatefulWidget {
  final double height;
  final double width;
  final int NbrNiveax;
  final int index;
  final Level href;
  const Niveau(
      {super.key,
      required this.height,
      required this.width,
      required this.NbrNiveax,
      required this.index,
      required this.href});
  @override
  State<Niveau> createState() => _NiveauState();
}

class _NiveauState extends State<Niveau> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: widget.index % 2 == 0
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if (!widget.href.returnIsLocked()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.href),
                ).then((_) => setState(() {}));
              }
            },
            child: Container(
              height: 120.0,
              width: 100,
              child: !widget.href.returnIsLocked()
                  ? Stack(
                      children: [
                        Container(
                          height: 120.0,
                          width: 100,
                        ),
                        const Image(
                            image:
                                AssetImage("assets/images/opened-level.png")),
                        Positioned(
                          top: 85.0,
                          left: 7.0,
                          child: RectangleButton(
                            couleur1: const Color.fromARGB(255, 255, 209, 23),
                            couleur2: const Color.fromARGB(255, 255, 209, 23),
                            text: "Niveau ${widget.index + 1}",
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          height: 120.0,
                          width: 100,
                        ),
                        const Image(
                            image: AssetImage("assets/images/close-level.png")),
                        Positioned(
                          top: 85.0,
                          left: 7.0,
                          child: RectangleButton(
                            couleur1: const Color.fromARGB(255, 170, 130, 29),
                            couleur2: const Color.fromARGB(255, 141, 104, 12),
                            text: "Niveau ${widget.index + 1}",
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
