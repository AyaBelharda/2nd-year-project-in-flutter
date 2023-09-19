import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../BackEnd/PlayerProgress/player.dart';
import '../player_box.dart';
import 'quizphotos.dart';
import 'package:sorttrash/quiz/quizmultiples.dart';
import 'package:sorttrash/quiz/quizgestes.dart';
import 'package:sorttrash/button.dart';
import 'package:audioplayers/audioplayers.dart';


class Level extends StatefulWidget {
  late Function(bool) _changeBooleanStatus;
  final List<Widget> liste;
  int _currentIndex = 0;
  Level({
    super.key,
    required Function(bool) changeBooleanStatus,
    required bool isLocked,
    required this.liste,
  }) {
    _changeBooleanStatus = changeBooleanStatus;
    _isLocked = isLocked;
  }
  bool _isLocked = false;

  bool returnIsLocked() {
    return _isLocked;
  }

  void setIsLocked(bool isUnlockde) {
    _isLocked = isUnlockde;
  }

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  final User? user = FirebaseAuth.instance.currentUser;
  final _player = AudioPlayer();
  late PlayerProgress playerProgress = currentProfileIndex == 1
      ? offlineProgress.returnParent().children[globalChildKey]
      : onlineProgress.returnParent().children[onlineGlobalChildKey];
  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );
    if (widget._currentIndex == widget.liste.length) widget._currentIndex = 0;
  }

  Widget build(BuildContext context) {
    dynamic wid , wid2;
    if (widget._currentIndex > 0) wid2 = widget.liste[widget._currentIndex -1];
    if (widget._currentIndex<widget.liste.length)wid = widget.liste[widget._currentIndex];
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg-image3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      widget._currentIndex = widget._currentIndex - 1;
                    });
                    await Navigator.popAndPushNamed(context, '/Nquiz');
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 102, 235, 0),
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: const Offset(
                              0, 4.2), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 102, 235, 0),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                RoundButton(
                  href: '/',
                  myIcon: Icons.settings,
                  shadowColor: Color.fromRGBO(255, 210, 23, 5),
                  couleur: Color.fromRGBO(255, 210, 23, 5),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 0.75 * MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 0.7 * MediaQuery.of(context).size.height,
                width: 0.75 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.0),
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 0.4 * MediaQuery.of(context).size.height,
                      width: 0.15 * MediaQuery.of(context).size.width,
                      child:
                          Image(image: AssetImage("assets/images/logo2.png")),
                    ),
                    Container(
                      height: 0.65 * MediaQuery.of(context).size.height,
                      width: 0.55 * MediaQuery.of(context).size.width,
                      child: Expanded(
                        child: Center(
                          child: Text(
                            (widget._currentIndex == 0)
                                ? "Preparez vous pour ce niveau"
                                : (wid2 is QuizMultiples)
                                    ? wid2.explication
                                    :(wid2 is QuizPhotosDesign)?wid2.quizPhotos.explication
                                    :(wid2 is QuizGestes) ? wid2.explication
                                    : "",
                            textAlign: TextAlign.center,
                            style:const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: "Degital",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0.65 * MediaQuery.of(context).size.height,
                left: 0.31 * MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: widget._currentIndex < widget.liste.length 
                      ? () async {
                        if (wid is QuizMultiples){
                          _player.play(AssetSource(wid.SoundPath));
                        }
                        if (wid is QuizGestes){
                          _player.play(AssetSource(wid.SoundPath));
                        }
                        if (wid is QuizPhotosDesign){
                          _player.play(AssetSource(wid.quizPhotos.SoundPath));
                        }
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    widget.liste[widget._currentIndex]),
                                    
                          );
                          _player.stop();
                          setState(() {
                            widget._currentIndex += 1;
                          });
                        }
                      : (() {
                          widget._changeBooleanStatus(false);
                          String newLevelsCompleted = playerProgress
                              .gamesData[2].levelsCompleted
                              .replaceFirst('0', '1');
                          playerProgress.gamesData[2].levelsCompleted =
                              newLevelsCompleted;
                          try {
                            if (currentProfileIndex == 1) {
                              offlineProgress.setChild(
                                  globalChildKey, playerProgress);
                              if (parentBox.isEmpty) {
                                parentBox.add(offlineProgress);
                              } else {
                                parentBox.putAt(
                                    0, offlineProgress.returnParent());
                              }
                            } else {
                              onlineProgress.setChild(
                                  onlineGlobalChildKey, playerProgress);
                              onlineParentBox.put(
                                  user!.uid, onlineProgress.returnParent());
                              onlineProgress
                                  .returnParent()
                                  .updateData(onlineProgress.getUID());
                            }
                          } catch (e) {
                            print(e);
                          }
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/Nquiz');
                        }),
                  child: Stack(
                    children: [
                      Container(
                        //le grand container vert
                        height: 35.0,
                        width: 86.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromARGB(
                              255, 145, 245, 64), //secondaire
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2.0,
                        left: 2.0,
                        child: Container(
                          height: 28.0,
                          width: 82.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: const Color.fromARGB(
                                255, 102, 235, 0), //principal
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox()
      ]),
    ));
  }
}
