import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

import '../StartPage/settings.dart';
import '../card_bg.dart';

class GamesMenu extends StatefulWidget {
  const GamesMenu({super.key});

  @override
  State<GamesMenu> createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
  bool isSignedIn = false;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
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
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 330.0,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          //pour creer un alignement des elements
                          height: 60.0,
                          width: 150.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                const RoundButton(
                                    href: '/',
                                    myIcon: Icons.home,
                                    couleur: Color.fromRGBO(255, 210, 23, 5),
                                    shadowColor: Color.fromRGBO(255, 210, 23, 5),
                                ), //le premier button
                                const RoundButton(
                                    href: '/TrophiesPage',
                                    myIcon: Icons
                                        .woo_commerce,
                                        couleur: Color.fromRGBO(255, 210, 23, 5),
                                  shadowColor: Color.fromRGBO(255, 210, 23, 5),
                                        ), //le deuxieme button
                                isSignedIn ?
                                RoundButtonSettingsWhileLogged(
                                    myIcon: Icons.settings, value: 5)
                                    : RoundButtonSettings(
                                    myIcon: Icons.settings, value: 5)
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'QUIZ',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              couleur3: Colors.white,
                              href: '/Nquiz',
                              Photo: "boy.png",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'TRI',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              couleur3: Colors.white,
                              href: '/Niveaux',
                              Photo: "girl.png",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'PUZZLE',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              couleur3: Colors.white,
                              href: '/Puzzles',
                              Photo: "group.png",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'DEFIS',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              couleur3: Colors.white,
                              href: '/defis',
                              Photo: "defis.png",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
