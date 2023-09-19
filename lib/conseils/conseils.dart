
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../StartPage/settings.dart';
import '../button.dart';

class advice {
  final String titre;
  final String contenu;
  advice({required this.titre, required this.contenu});
}

class Conseils extends StatefulWidget {
  List<advice> cons = [
    advice(
        contenu:
            "Bonjour à tous ! Je suis votre chère Terry, votre planète, votre maison.Je suis ravie de vous parler aujourd'hui de quelque chose qui me tient particulièrement à cœur : le recyclage. ",
        titre: "INTRODUCTION"),
    advice(
        contenu:
            "Malheureusement, je souffre de plus en plus  chaque  jour à cause des  tonnes de déchets que vous produisez,  car ils polluent mes océans, mes rivières, mes forêts et mon air.",
        titre: "INTRODUCTION"),
    advice(
        contenu:
            "Je vous demande donc de faire un geste important pour moi : recycler.",
        titre: "Introduction"),
    advice(
        titre: "C’EST QUOI LE RECYCLAGE?",
        contenu:
            "Le recyclage est un moyen de réutiliser les choses que nous avons déjà utilisées afin que nous n'ayons pas à fabriquer de nouvelles choses à partir de zéro."),
    advice(
        titre: "THEORIE DE TRI",
        contenu:
            "Maintenant ,On va ensemble apprendre comment trier et classer chaque déchet dans sa propre poubelle?"),
    advice(titre: "COMPOST-Organique-", contenu: "COULEUR DE POUBELLE : Gris "),
    advice(titre: "Ses déchets : ", contenu: "déchets verts\nrestes de repas"),
    advice(
        titre: "Indication ",
        contenu:
            "Jette-les en vrac dans le composteur de ton jardin. Il y a aussi des composteurs à disposition dans ta ville !"),
    advice(titre: "Plastique", contenu: "COULEUR DE POUBELLE : Orange"),
    advice(
        titre: "Ses déchets",
        contenu:
            "boîtes de conservebouteilles \n flacons en plastique \n sachets"),
    advice(
        titre: "Indication ",
        contenu:
            "Jette-les en vrac, vidés de leur contenu,\n avec leurs bouchons."),
    advice(titre: "Verre", contenu: "COULEUR DE POUBELLE : vert "),
    advice(titre: "Ses déchets", contenu: "bouteille\nbocaux\nflacons"),
    advice(
        titre: "Indication",
        contenu: "Jette-les en vrac, lavés, sans bouchon ou couvercle"),
    // advice(titre: titre, contenu: contenu),
    // advice(titre: titre, contenu: contenu),
  ];
  int currentAdvice = 0;
  Conseils({super.key});

  @override
  State<Conseils> createState() => _ConseilsState();
}

class _ConseilsState extends State<Conseils> {
  bool isSignedIn = false;
  final User? user = FirebaseAuth.instance.currentUser;
  void initState() {
    if (user != null) {
      if (!user!.emailVerified) {
        setState(() {
          user!.delete();
          FirebaseAuth.instance.signOut();
        });
      } else {
        setState(() {
          isSignedIn = true;
        });
      }
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              alignment: Alignment.center,
              height: 0.88 * MediaQuery.of(context).size.height,
              // width: ,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                              shadowColor: Colors.green,
                              href: '/',
                              myIcon: Icons.arrow_back,
                              couleur: Colors.green),
                        ],
                      ),
                      Row(
                        children: [
                          isSignedIn
                              ? RoundButtonSettingsWhileLogged(
                                  myIcon: Icons.settings, value: 5)
                              : RoundButtonSettings(
                                  myIcon: Icons.settings, value: 5),
                          const SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ), //les bouttons en haut
                  Container(
                    //debut de corps de conseils
                    height: 0.67 * MediaQuery.of(context).size.height,
                    width: 0.6 * MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.currentAdvice != 0)
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 0.1 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.currentAdvice -= 1;
                                      });
                                    },
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/leftbutton.png"),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                // width: 0.045 * MediaQuery.of(context).size.width,
                                ),
                        Stack(
                          children: [
                            Container(
                              //le contenu
                              width: 0.5 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(21.0),
                              ),
                              child: Center(
                                child: Container(
                                  height:
                                      0.54 * MediaQuery.of(context).size.height,
                                  width:
                                      0.45 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 76, 218, 254),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 0.35 *
                                          MediaQuery.of(context).size.height,
                                      width: 0.4 *
                                          MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Text(
                                          "${widget.cons[widget.currentAdvice].contenu}",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Color.fromARGB(
                                                255, 118, 120, 120),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.015 * MediaQuery.of(context).size.height,
                              left: 0.15 * MediaQuery.of(context).size.width,
                              child: Container(
                                height:
                                    0.12 * MediaQuery.of(context).size.height,
                                width: 0.2 * MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 76, 218, 254),
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${widget.cons[widget.currentAdvice].titre}',
                                        style: const TextStyle(
                                          fontFamily: 'Digital',
                                          color: Colors.white,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.02 * MediaQuery.of(context).size.height,
                              left: 0.05 * MediaQuery.of(context).size.width,
                              child: const Image(
                                image: AssetImage("assets/images/pointsh.png"),
                              ),
                            ),
                            Positioned(
                              top: 0.2 * MediaQuery.of(context).size.height,
                              right: 0.01 * MediaQuery.of(context).size.width,
                              child: const Image(
                                image: AssetImage("assets/images/pointsv.png"),
                              ),
                            ),
                            Positioned(
                              top: 0.4 * MediaQuery.of(context).size.height,
                              right: 0.01 * MediaQuery.of(context).size.width,
                              child: const Image(
                                image: AssetImage("assets/images/logo1.png"),
                              ),
                            ),
                          ],
                        ),
                        if ((widget.currentAdvice != widget.cons.length - 1))
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    0.1 * MediaQuery.of(context).size.height,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.currentAdvice += 1;
                                  });
                                },
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/rightbutton.png"),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ), //le corps du conseils
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
