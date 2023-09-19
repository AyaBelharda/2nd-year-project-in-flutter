import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/Silder.dart';
import 'package:sorttrash/button.dart';

class RoundButtonSettings extends StatelessWidget {
  final IconData myIcon;
  double value = 5;
  RoundButtonSettings({super.key, required this.myIcon, required this.value});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  // contentPadding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.all(10),
                  content: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 300,
                            height: 265,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white30,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      1, 6), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            103, 235, 0, 1),
                                        side: const BorderSide(
                                            width: 1, color: Colors.black38),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.only(
                                            left: 80,
                                            right: 80,
                                            top: 1,
                                            bottom: 3)),
                                    child: const Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Digital',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Music',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 210, 23, 5),
                                      fontSize: 20,
                                      fontFamily: 'Digital',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SilderMusic(
                                    value: value,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Sound',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 210, 23, 5),
                                      fontSize: 20,
                                      fontFamily: 'Digital',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SilderMusic(
                                    value: value,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 90+52,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 25,
                                            width: 90,
                                            child: FittedBox(
                                              child: Center(
                                                child: Text(
                                                  "LANGUE",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 210, 23, 5),
                                                      fontSize: 25,
                                                      fontFamily: 'Digital',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            width: 50,
                                            decoration:  BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: const Color.fromRGBO(62,206,254, 1),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "EN",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontFamily: 'Digital',
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                     await Navigator.popAndPushNamed(
                                          context, '/LoginPage');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            62, 206, 254, 1),
                                        padding: const EdgeInsets.only(
                                            left: 40,
                                            right: 40,
                                            top: 5,
                                            bottom: 8)),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Digital',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            left: 370,
                            top: 0,
                            child: RoundButton(
                              myIcon: Icons.exit_to_app,
                              href: '/StartPage',
                              couleur: Color.fromRGBO(255, 210, 23, 5),
                              shadowColor:Color.fromRGBO(255, 210, 23, 5) ,
                            ))
                      ],
                    ),
                  ));
            });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
              color: Color.fromRGBO(255, 210, 23, 5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 4.2), // changes position of shadow
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

              color: const Color.fromRGBO(255, 210, 23, 5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                myIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundButtonSettingsWhileLogged extends StatelessWidget {
  final IconData myIcon;
  double value = 5;
  RoundButtonSettingsWhileLogged(
      {super.key, required this.myIcon, required this.value});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertDialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(10),
                    content: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 500,
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 100,
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 265,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white30,
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          1, 6), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.greenAccent,
                                            side: const BorderSide(
                                                width: 3, color: Colors.black38),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            padding: const EdgeInsets.only(
                                                left: 80,
                                                right: 80,
                                                top: 1,
                                                bottom: 3)),
                                        child: const Text(
                                          'Settings',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Digital',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Music',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 210, 23, 5),
                                          fontSize: 20,
                                          fontFamily: 'Digital',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SilderMusic(
                                        value: value,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        'Sound',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 210, 23, 5),
                                          fontSize: 20,
                                          fontFamily: 'Digital',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SilderMusic(
                                        value: value,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 90+52,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 25,
                                                width: 90,
                                                child: FittedBox(
                                                  child: Center(
                                                    child: Text(
                                                      "LANGUE",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255, 210, 23, 5),
                                                          fontSize: 25,
                                                          fontFamily: 'Digital',
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 50,
                                                decoration:  BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: const Color.fromRGBO(62,206,254, 1),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "EN",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontFamily: 'Digital',
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/ProfilePage');
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            padding: const EdgeInsets.only(
                                                left: 40,
                                                right: 40,
                                                top: 5,
                                                bottom: 8)),
                                        child: const Text(
                                          'Profile',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Digital',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                              left: 370,
                              top: 0,
                              child: RoundButton(
                                myIcon: Icons.exit_to_app,
                                href: '/StartPage',
                                couleur: Color.fromRGBO(255, 210, 23, 5),
                                shadowColor: Color.fromRGBO(255, 210, 23, 5),
                              ))
                        ],
                      ),
                    )),
              );
            });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
              color: Color.fromRGBO(255, 210, 23, 5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 4.2), // changes position of shadow
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
              color: const Color.fromRGBO(255, 210, 23, 5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                myIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
