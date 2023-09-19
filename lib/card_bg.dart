import 'package:flutter/material.dart';
import 'button.dart';

class cardBg extends StatelessWidget {
  //la classe qui contient le frame de bg_card (dans le UI)
  final String Photo; //pour insere la photo;
  final String? title; //pour rajouter de contenu dans le frame
  final Color coleur1;
  final Color coleur2;
  final Color couleur3;
  final String href;
  const cardBg({
    super.key,
    required this.title,
    required this.coleur1,
    required this.coleur2,
    required this.couleur3,
    required this.href,
    required this.Photo,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, href);
      },
      child: SizedBox(
        height: 250.0,
        width: 180.0,
        child: Stack(children: [
          Container(
            //le grand carré vert
            height: 230.0,
            width: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.0),
              color: this.coleur2,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Stack(
              children: [
                Container(
                  //le deuxieme carré vert
                  height: 225.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.0),
                    color: this.coleur2,
                    boxShadow: const [
                      //le shadow du box vert
                      BoxShadow(
                        color: Color.fromARGB(255, 70, 67, 67),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 3.0,
                  left: 5.0,
                  right: 5.0,
                  child: Container(
                    //ke troisieme carré blanc
                    height: 210.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27.0),
                      color: couleur3,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 180.0,
                            width: 150.0,
                            child: Image.asset(
                              'assets/images/${this.Photo}',
                            ),
                          ),
                        ),
                      ],
                    ), //le text se rajoute ici
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            //placer le boutton de
            top: 200.0,
            left: 47.0,
            // child: RectangleButton(couleur2: Color.fromARGB(255, 102, 235, 0) , couleur1: Color.fromARGB(255, 79, 195, 7) ,text: this.title, ),
            child: RectangleButton(
              couleur2: this.coleur2,
              couleur1: this.coleur1,
              text: this.title,
            ),
          ),
        ]),
      ),
    );
  }
}
