import 'package:flutter/material.dart';

const Color pm = Color.fromRGBO(177, 229, 242, 1);
const Color sm = Color.fromRGBO(131, 85, 253, 1);
const Color sm1 = Color.fromRGBO(253,194,17, 1);
class KeyContainer extends StatefulWidget {
  const KeyContainer({Key? key, required this.state, required this.text}) : super(key: key);
  final bool state;
  final String text;
  bool returnState(){
    return state;
  }
  @override
  State<KeyContainer> createState() => _KeyContainerState();
}
class _KeyContainerState extends State<KeyContainer> {

  @override
  Widget build(BuildContext context) {
    return  widget.state
          ?  ContainerDesign(
              primaryColor: pm, secondaryColor: sm, assetImage: 'assets/images/violet_key.png', text: widget.text, isLocked: widget.state,)
          :  ContainerDesign(
              primaryColor: pm,
              secondaryColor: sm1,
              assetImage: 'assets/images/gold_key.png',
              text: widget.text,
              isLocked: widget.state,
    );
  }
}

class ContainerDesign extends StatelessWidget {
   const ContainerDesign(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.assetImage,
      required this.text,
      required this.isLocked
      })
      : super(key: key);
  final Color primaryColor;
  final Color secondaryColor;
  final String assetImage;
  final String text;
  final bool isLocked;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 0.19*MediaQuery.of(context).size.height,
              width: 0.08*MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Container(
              height: 0.14*MediaQuery.of(context).size.height ,
              width: 0.08*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: secondaryColor,
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage( image: AssetImage(assetImage))
                ),
              )
            ),
          ),
          Positioned(
            left: 0.03246*MediaQuery.of(context).size.width,
            top: 0.16*MediaQuery.of(context).size.height,
            child: Container(
              height:  0.03* MediaQuery.of(context).size.width,
              width: 0.054* MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  ),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                    fontFamily: 'Digital',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
