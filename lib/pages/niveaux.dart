import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/sort_game/Levels/levels_managment.dart';
import 'dart:ui' as ui;
import '../composents/niveau.dart';

//la page de la gestion de niveaux
double width = ui.window.physicalSize.width;
double height = ui.window.physicalSize.height;

class Niveaux extends StatefulWidget {
  late LevelManagement _levelManagement;
  final int NbrNiveax;
  final int OpenLevels;
  final String href;
  Niveaux(
      {super.key,
      required this.NbrNiveax,
      required this.OpenLevels,
      required this.href,
      required LevelManagement levelMangement}) {
    _levelManagement = levelMangement;
  }

  @override
  State<Niveaux> createState() => _NiveauxState();
}

class _NiveauxState extends State<Niveaux> {
  @override
  void initState() {
    setState(() {
    });
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
                      child: RoundButton(href: '/games', myIcon: Icons.arrow_back , couleur: Color.fromRGBO(255, 210, 23, 5), shadowColor:  Color.fromRGBO(255, 210, 23, 5) ,),
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
                              myIcon: Icons.home , couleur: Color.fromRGBO(255, 210, 23, 5), shadowColor: Color.fromRGBO(255, 210, 23, 5) ,), //le premier button
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
                    width: 0.026*MediaQuery.of(context).size.width,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //le corps de niveaux
                      height: 0.75*MediaQuery.of(context).size.height,
                      width: 100.0 * widget.NbrNiveax +
                          50 * (widget.NbrNiveax - 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromARGB(211, 178, 158, 211),
                      ),
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(widget.NbrNiveax, (index) {
                        return index != widget.NbrNiveax - 1
                            ? Row(
                                children: [
                                  Niveau(
                                    NbrNiveax: widget.NbrNiveax,
                                    height: height,
                                    width: width,
                                    index: index,
                                    href: widget._levelManagement
                                        .levelsContainer[index],
                                  ),
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 0.4 * height,
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
                                NbrNiveax: widget.NbrNiveax,
                                height: height,
                                width: width,
                                index: index,
                                href: widget
                                    ._levelManagement.levelsContainer[index],
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
