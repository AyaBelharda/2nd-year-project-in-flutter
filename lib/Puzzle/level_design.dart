import 'package:flutter/material.dart';
import 'package:sorttrash/Puzzle/Models/puzzle_management.dart';
import 'package:sorttrash/Puzzle/main_puzzle.dart';
import 'package:sorttrash/button.dart';

class PuzzleLevelDesign extends StatefulWidget {
  final double height;
  final double width;
  final int nbrNiveax;
  final int index;
  final PuzzleLevel href;
  const PuzzleLevelDesign(
      {super.key,
        required this.height,
        required this.width,
        required this.nbrNiveax,
        required this.index,
        required this.href});
  @override
  State<PuzzleLevelDesign> createState() => _PuzzleLevelDesign();
}

class _PuzzleLevelDesign extends State<PuzzleLevelDesign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.index % 2 == 0
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (!widget.href.returnIsLocked()) {
              setState(() {
                puzzleNumber = widget.index + 1;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget.href),
              ).then((_) => setState(() {}));
            }
          },
          child: SizedBox(
            height: 120.0,
            width: 100,
            child: !widget.href.returnIsLocked()
                ? Stack(
              children: [
                const SizedBox(
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
                const SizedBox(
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
    );
  }
}
