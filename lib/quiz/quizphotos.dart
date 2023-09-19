import 'package:flutter/material.dart';
import '../button.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizPhotos {
  String question;
  String photoQuestion;
  String reponse1;
  String photo1;
  String reponse2;
  String photo2;
  String reponse3;
  String photo3;
  String reponse4;
  String photo4;
  int reponseCorrecte;
  String explication;
  String SoundPath;
  QuizPhotos({
    required this.question,
    required this.photoQuestion,
    required this.reponse1,
    required this.photo1,
    required this.reponse2,
    required this.photo2,
    required this.reponse3,
    required this.photo3,
    required this.reponse4,
    required this.photo4,
    required this.reponseCorrecte,
    required this.explication,
    required this.SoundPath,
  });
}

class QuizPhotosDesign extends StatefulWidget {
  final QuizPhotos quizPhotos;
  const QuizPhotosDesign({
    super.key,
    required this.quizPhotos,
  });

  @override
  State<QuizPhotosDesign> createState() => _QuizPhotosDesignState();
}

class _QuizPhotosDesignState extends State<QuizPhotosDesign> {
  int? reponseUtilisateur;
  final _player = AudioPlayer();
  final _audio = AudioCache();
  String showState = "none";
  Future<void> waitAndPop() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  @override
  void initState() {
    _audio.load('music/correct.mp3');
    _audio.load('music/wrong.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-image3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 0.03 * MediaQuery.of(context).size.height,
            ),
            SizedBox(
              height: 0.15 * MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 20.0,
                      ),
                      RoundButton(
                          href: '/Nquiz',
                          myIcon: Icons.arrow_back,
                          shadowColor:  Color.fromARGB(255, 102, 235, 0),
                          couleur: Color.fromARGB(255, 102, 235, 0)),
                    ],
                  ),
                  Row(
                    children: const [
                      RoundButton(
                        href: '/',
                        myIcon: Icons.settings,
                        shadowColor:  Color.fromRGBO(255, 210, 23, 5),
                        couleur: Color.fromRGBO(255, 210, 23, 5),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.02 * MediaQuery.of(context).size.height,
            ),
            Stack(
              children: [
                Container(
                  //le container qui contient le corps du quiz
                  height: 0.75 * MediaQuery.of(context).size.height,
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      //le carré blanc qui contient les quiz
                      height: 0.7 * MediaQuery.of(context).size.height,
                      width: 0.75 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33.0),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        //les reponses sont dans tous ce qui suit
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            //le container des questions
                            height: 0.25 * MediaQuery.of(context).size.height,
                            width: 0.35 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 220, 247),
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                color: const Color.fromARGB(255, 251, 194, 240),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(181, 44, 43, 43)
                                      .withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: SizedBox(
                                    width:
                                        0.2 * MediaQuery.of(context).size.width,
                                    child: Center(
                                        child: Text(
                                      widget.quizPhotos.question,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 218, 78, 204),
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: SizedBox(
                                    height: 0.18 *
                                        MediaQuery.of(context).size.height,
                                    width: 0.08 *
                                        MediaQuery.of(context).size.width,
                                    child: Image(
                                      image: AssetImage(
                                        widget.quizPhotos.photoQuestion,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            //le container des reponses
                            height: 0.38 * MediaQuery.of(context).size.height,
                            width: 0.75 * MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height:
                                      0.37 * MediaQuery.of(context).size.height,
                                  width:
                                      0.17 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 1;
                                            showState = widget.quizPhotos
                                                        .reponseCorrecte ==
                                                    1
                                                ? "yes"
                                                : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: Container(
                                          height: 0.35 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.16 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 251, 194, 240),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        181, 44, 43, 43)
                                                    .withOpacity(0.5),
                                                offset: const Offset(2, 3),
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(widget
                                                        .quizPhotos.photo1),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  widget.quizPhotos.reponse1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -1,
                                        right: -1,
                                        child: showState == "yes" &&
                                                reponseUtilisateur == 1
                                            ? SizedBox(
                                                height: 0.08 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.04 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/juste.png"),
                                                ),
                                              )
                                            : showState == "no" &&
                                                    reponseUtilisateur == 1
                                                ? SizedBox(
                                                    height: 0.08 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 0.04 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "assets/images/faux.png"),
                                                    ),
                                                  )
                                                : Container(),
                                      ),
                                    ],
                                  ),
                                ), //----------------------------------------
                                Container(
                                  height:
                                      0.37 * MediaQuery.of(context).size.height,
                                  width:
                                      0.17 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 2;
                                            showState = widget.quizPhotos
                                                        .reponseCorrecte ==
                                                    2
                                                ? "yes"
                                                : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: Container(
                                          height: 0.35 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.16 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 251, 194, 240),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        181, 44, 43, 43)
                                                    .withOpacity(0.5),
                                                offset: const Offset(2, 3),
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(widget
                                                        .quizPhotos.photo2),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  widget.quizPhotos.reponse2,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -1,
                                        right: -1,
                                        child: showState == "yes" &&
                                                reponseUtilisateur == 2
                                            ? SizedBox(
                                                height: 0.08 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.04 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/juste.png"),
                                                ),
                                              )
                                            : showState == "no" &&
                                                    reponseUtilisateur == 2
                                                ? SizedBox(
                                                    height: 0.08 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 0.04 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "assets/images/faux.png"),
                                                    ),
                                                  )
                                                : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      0.37 * MediaQuery.of(context).size.height,
                                  width:
                                      0.17 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 3;
                                            showState = widget.quizPhotos
                                                        .reponseCorrecte ==
                                                    3
                                                ? "yes"
                                                : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: Container(
                                          height: 0.35 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.16 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 251, 194, 240),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        181, 44, 43, 43)
                                                    .withOpacity(0.5),
                                                offset: const Offset(2, 3),
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(widget
                                                        .quizPhotos.photo3),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  widget.quizPhotos.reponse3,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -1,
                                        right: -1,
                                        child: showState == "yes" &&
                                                reponseUtilisateur == 3
                                            ? SizedBox(
                                                height: 0.08 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.04 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/juste.png"),
                                                ),
                                              )
                                            : showState == "no" &&
                                                    reponseUtilisateur == 3
                                                ? SizedBox(
                                                    height: 0.08 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 0.04 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "assets/images/faux.png"),
                                                    ),
                                                  )
                                                : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      0.37 * MediaQuery.of(context).size.height,
                                  width:
                                      0.17 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 4;
                                            showState = widget.quizPhotos
                                                        .reponseCorrecte ==
                                                    4
                                                ? "yes"
                                                : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: Container(
                                          height: 0.35 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.16 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 251, 194, 240),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        181, 44, 43, 43)
                                                    .withOpacity(0.5),
                                                offset: const Offset(2, 3),
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(widget
                                                        .quizPhotos.photo4),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 0.15 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  widget.quizPhotos.reponse4,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -1,
                                        right: -1,
                                        child: showState == "yes" &&
                                                reponseUtilisateur == 4
                                            ? SizedBox(
                                                height: 0.08 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.04 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/juste.png"),
                                                ),
                                              )
                                            : showState == "no" &&
                                                    reponseUtilisateur == 4
                                                ? SizedBox(
                                                    height: 0.08 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 0.04 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "assets/images/faux.png"),
                                                    ),
                                                  )
                                                : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
