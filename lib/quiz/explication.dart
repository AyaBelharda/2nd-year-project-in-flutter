import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';


class ExplicationPage extends StatelessWidget {
  final String Explication;
  const ExplicationPage({super.key, required this.Explication});

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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
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
                    shadowColor: Color.fromARGB(255, 102, 235, 0),
                    couleur: Color.fromARGB(255, 102, 235, 0)),
              ],
            ),
            Row(
              children: const [
                RoundButton(
                  href: '/',
                  myIcon: Icons.settings,
                  shadowColor:Color.fromRGBO(255, 210, 23, 5) ,
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
                            Explication,
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                left: 0.31*MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () => Navigator.popUntil(context, ModalRoute.withName('/Level')),
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