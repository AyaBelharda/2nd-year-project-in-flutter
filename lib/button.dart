import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final String? href; //pour indiquer le chemin à prendre en cliquant sur l'icon
  final IconData myIcon;
  final Color couleur;
  final Color shadowColor;
  const RoundButton(
      {super.key, required this.href, required this.myIcon, required this.couleur, required this.shadowColor});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {

       if (widget.href != '-'){
         await Navigator.popAndPushNamed(context, '${widget.href}');
       }
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color: widget.shadowColor,
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 4.2), // changes position of shadow
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
              color: widget.couleur,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                widget.myIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final Color couleur1;
  final Color couleur2;
  final String? text;
  const RectangleButton(
      {super.key,
      required this.couleur1,
      required this.couleur2,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //le grand container vert
          height: 35.0,
          width: 86.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: couleur1, //secondaire
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
              color: couleur2, //principal
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                child: Text(
                  "$text",
                  style: const TextStyle(
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
    );
  }
}
