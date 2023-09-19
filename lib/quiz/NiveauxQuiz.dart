import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'dart:ui' as ui;
import 'NiveauQuiz.dart';
import 'managementQuiz.dart';

//la page de la gestion de niveaux
double width = ui.window.physicalSize.width;
double height = ui.window.physicalSize.height;

class NiveauxQuiz extends StatefulWidget {
  late final  Management _levelManagement;
  final int nbrNiveax;
  final int openLevels;
  final String href;
  NiveauxQuiz(
      {super.key,
      required this.nbrNiveax,
      required this.openLevels,
      required this.href,
      required Management levelMangement}) {
    _levelManagement = levelMangement;
  }

  @override
  State<NiveauxQuiz> createState() => _NiveauxQuizState();
}

class _NiveauxQuizState extends State<NiveauxQuiz> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //le container qui contient le bg image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Row(
              //les bouttons au-dessus
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: Center(
                      child: RoundButton(
                        href: '/games',
                        myIcon: Icons.arrow_back,
                        couleur: Color.fromRGBO(255, 210, 23, 5),
                        shadowColor: Color.fromRGBO(255, 210, 23, 5) ,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5.0, 15.0, 0.0),
                  child: SizedBox(
                    //pour creer un alignement des elements
                    height: 60.0,
                    width: 120.0,
                    // color: Colors.amber,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const RoundButton(
                            href: '/',
                            myIcon: Icons.home,
                            couleur: Color.fromRGBO(255, 210, 23, 5),
                            shadowColor: Color.fromRGBO(255, 210, 23, 5) ,
                          ), //le premier button
                          RoundButton(
                            href: widget.href,
                            myIcon: Icons.settings,
                            couleur: const Color.fromRGBO(255, 210, 23, 5),
                            shadowColor: const Color.fromRGBO(255, 210, 23, 5),
                          ), //le deuxieme button
                        ]),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width:  0.026*MediaQuery.of(context).size.width,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //le corps de niveaux
                      height: 0.75*MediaQuery.of(context).size.height,
                      width: 100.0 * widget.nbrNiveax +
                          50 * (widget.nbrNiveax - 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromARGB(211, 178, 158, 211),
                      ),
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(widget.nbrNiveax, (index) {
                        return index != widget.nbrNiveax - 1
                            ? Row(
                                children: [
                                  Niveau(
                                    nbrNiveax: widget.nbrNiveax,
                                    height: height,
                                    width: width,
                                    index: index,
                                    href: widget
                                        ._levelManagement.QuizContainer[index],
                                  ),
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 0.75 * height,
                                        width: 50.0,
                                        // color: Colors.amber,
                                      ),
                                      Positioned(
                                        top: 0.1 * height,
                                        child: SizedBox(
                                            width: 50.0,
                                            height: 170,
                                            // color: Colors.black,
                                            child: index % 2 != 0
                                                ? const Image(
                                                    image: AssetImage(
                                                        "assets/images/triAss.png"))
                                                : const Image(
                                                    image: AssetImage(
                                                        "assets/images/triDes.png"))),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Niveau(
                                nbrNiveax: widget.nbrNiveax,
                                height: height,
                                width: width,
                                index: index,
                                href: widget
                                    ._levelManagement.QuizContainer[index],
                              );
                      })),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
