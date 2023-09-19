import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/Puzzle/Models/Objects.dart';
import 'package:sorttrash/Puzzle/Models/TrashCans.dart';
import 'package:sorttrash/Puzzle/Models/puzzle_management.dart';
import 'package:sorttrash/composents/game_settings.dart';

import '../BackEnd/PlayerProgress/player.dart';
import '../player_box.dart';
import 'Models/timer.dart';

class PuzzleLevel extends StatefulWidget {
  late Function(bool) _changeBooleanStatus;
  PuzzleLevel(
      {super.key,
      required List<Piece> arrayOfPuzzlePieces,
      required List<Square> arrayOfSquares,
      required Function(bool) changeBooleanStatus,
      required bool isLocked,
      required int timeCount,
      required int matrixSSize,
      required String imageName}) {
    _arrayOfPuzzlePieces = arrayOfPuzzlePieces;
    _arrayOfSquares = arrayOfSquares;
    _changeBooleanStatus = changeBooleanStatus;
    _isLocked = isLocked;
    _copyOfarrayOfPuzzlePieces = arrayOfPuzzlePieces.toList();
    _imageName = imageName;
    _timeCount = timeCount;
    _matrixSize = matrixSSize;
  }
  bool _isLocked = false;
  bool _isFinished = false;
  late List<Piece> _arrayOfPuzzlePieces;
  late final int _timeCount;
  late final int _matrixSize;
  late final String _imageName;
  late List<Piece> _copyOfarrayOfPuzzlePieces;
  late List<Square> _arrayOfSquares;
  bool returnIsLocked() {
    return _isLocked;
  }

  bool returnIsFinished() {
    return _isFinished;
  }

  void setIsLocked(bool isUnlockde) {
    _isLocked = isUnlockde;
  }

  void setIsFinished(bool isFinished) {
    _isFinished = isFinished;
  }

  @override
  State<PuzzleLevel> createState() => _PuzzleLevelState();
}

class _PuzzleLevelState extends State<PuzzleLevel> {
  bool stopTimerBool = false;
  void stopTimer(){
    setState(() {
      stopTimerBool = true;
    });
  }
  void resumeTimer(){
    setState(() {
      stopTimerBool = false;
    });
  }
  void replay() {
    setState(() {
      int i = 0;
      time = widget._timeCount;
      widget._copyOfarrayOfPuzzlePieces.shuffle();
      correctPiecesNumber = 0;
      widget._arrayOfPuzzlePieces = widget._copyOfarrayOfPuzzlePieces.toList();
      while (i < widget._arrayOfSquares.length - 1) {
        widget._arrayOfSquares[i].imageName = "assets/images/empty.png";
        i++;
      }
    });
  }

  final _player = AudioPlayer();
  final User? user = FirebaseAuth.instance.currentUser;
  final ConfettiController _controller = ConfettiController();
  late PlayerProgress playerProgress = currentProfileIndex == 1
      ? offlineProgress.returnParent().children[globalChildKey]
      : onlineProgress.returnParent().children[onlineGlobalChildKey];
  final _audio = AudioCache();
  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;
  int index = 0;
  late Timer timer;
  late int time = widget._timeCount;
  late int correctPiecesNumber = 0;
  @override
  void initState() {
    int i = 0;
    _audio.load('music/correct.mp3');
    _audio.load('music/wrong.mp3');
    setState(() {
      widget._copyOfarrayOfPuzzlePieces.shuffle();
      correctPiecesNumber = 0;
      widget._arrayOfPuzzlePieces = widget._copyOfarrayOfPuzzlePieces.toList();
    });
    while (i < widget._arrayOfSquares.length - 1) {
      widget._arrayOfSquares[i].imageName = "assets/images/empty.png";
      i++;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time <= 0) {
          time = 0;
          if ( correctPiecesNumber != widget._matrixSize*widget._matrixSize){
            Navigator.pop(context);
          }
        } else {
          if (!stopTimerBool){
            time--;
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirection: 3.14 / 2,
              maxBlastForce: 5,
              minBlastForce: 1,
              emissionFrequency: 0.03,
              numberOfParticles: 10,
              shouldLoop: true,
              gravity: 0,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg-image.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GameTimer(
                      time: time,
                    ),
                    GamesSettings(functionToBeUsed: replay, functionToResumeTimer: resumeTimer, functionToStopTimer: stopTimer,),
                    SizedBox(
                      width: 0.013888 * screenWidth,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GridView.count(
                            crossAxisCount: widget._matrixSize,
                            children: [
                              for (int i = 0;
                                  i < widget._matrixSize * widget._matrixSize;
                                  i++)
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[100],
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  child: Center(
                                    child: showSquare(
                                      context,
                                      square: widget._arrayOfSquares[i],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(widget._imageName),
                          fit: BoxFit.fill,
                        )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildDragInterface(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showSquare(
    BuildContext context, {
    required Square square,
  }) {
    return DragTarget<Piece>(
      builder: (context, candidateData, rejectedData) => Stack(
        children: [
          Center(
            child: Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(square.imageName), fit: BoxFit.fill),
              color: Colors.transparent,
            )),
          ),
        ],
      ),
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (square.id == data.id) {
          setState(() {
            int i = 0;
            correctPiecesNumber++;
            square.imageName = data.imageName;
            widget._arrayOfPuzzlePieces
                .removeWhere((trash) => trash.id == data.id);
            if (correctPiecesNumber ==
                widget._matrixSize * widget._matrixSize) {
              widget._arrayOfPuzzlePieces =
                  widget._copyOfarrayOfPuzzlePieces.toList();
              widget.setIsFinished(true);
              widget._changeBooleanStatus(false);
              playerProgress.score += 100;
              setState(() {
                if (puzzleNumber <
                    playerProgress.gamesData[0].levelsCompleted.length) {
                  List<String> characters =
                      playerProgress.gamesData[0].levelsCompleted.split('');
                  characters[puzzleNumber] = '1';
                  playerProgress.gamesData[0].levelsCompleted =
                      characters.join('');
                }
              });
              try {
                if (currentProfileIndex == 1) {
                  offlineProgress.setChild(globalChildKey, playerProgress);
                  if (parentBox.isEmpty) {
                    parentBox.add(offlineProgress);
                  } else {
                    parentBox.putAt(0, offlineProgress.returnParent());
                  }
                } else {
                  onlineProgress.setChild(onlineGlobalChildKey, playerProgress);
                  onlineParentBox.put(user!.uid, onlineProgress.returnParent());
                  onlineProgress
                      .returnParent()
                      .updateData(onlineProgress.getUID());
                }
              } catch (e) {
                print(e);
              }
              while (i < widget._arrayOfSquares.length - 1) {
                widget._arrayOfSquares[i].imageName = "assets/images/empty.png";
                i++;
              }
              Navigator.popAndPushNamed(context, '/Puzzles');
            }
          });
          _player.play(AssetSource('music/correct.mp3'));
          _player.stop();
        } else {
          time = time - 5;
          _player.play(AssetSource('music/wrong.mp3'));
          _player.stop();
        }
      },
    );
  }

  Widget buildDragInterface() {
    return Padding(
      padding: const EdgeInsets.only(left: BorderSide.strokeAlignCenter),
      child: Container(
        height: 60,
        width: 435,
        margin: EdgeInsets.only(
            left: 0.20 * screenWidth, right: 0.20 * screenWidth),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.lightGreenAccent,
            width: 3.0,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ...widget._arrayOfPuzzlePieces
                .map((trash) => Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: DraggablePiece(trash: trash),
                    ))
                .toList(),
          ]),
        ),
      ),
    );
  }
}

class DraggablePiece extends StatelessWidget {
  final Piece trash;
  const DraggablePiece({
    Key? key,
    required this.trash,
  }) : super(key: key);
  static double size = 50;
  @override
  Widget build(BuildContext context) => Draggable<Piece>(
        data: trash,
        feedback: image(),
        childWhenDragging: Container(height: size),
        child: image(),
      );

  Widget image() => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(trash.imageName),
            fit: BoxFit.fill,
          ),
          // borderRadius: BorderRadius.circular(5),
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          color: Colors.transparent,
        ),
      );
}
