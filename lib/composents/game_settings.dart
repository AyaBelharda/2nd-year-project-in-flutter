import 'package:flutter/material.dart';
import '../defis/key_container.dart';

class GamesSettings extends StatelessWidget {
  const GamesSettings({Key? key, required this.functionToBeUsed, required this.functionToResumeTimer, required this.functionToStopTimer}) : super(key: key);
  final void Function() functionToBeUsed;
  final void Function() functionToStopTimer;
  final void Function() functionToResumeTimer;
  @override
  Widget build(BuildContext context) {
    void popAndResume(){
      functionToResumeTimer();
      Navigator.pop(context);
    }
    void popAndReplay(){
      functionToResumeTimer();
      Navigator.pop(context);
      functionToBeUsed();
    }
    void popAndQuit(){
      Navigator.popAndPushNamed(context, '/games');
    }
    return InkWell(
      onTap: () {
        functionToStopTimer();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: WillPopScope(
                  onWillPop: () async => false,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white30,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 6), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children:  [
                          Container(
                            width: 0.26*MediaQuery.of(context).size.width,
                            height:0.1*MediaQuery.of(context).size.height ,
                            decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 2, color: Colors.black54)
                            ),
                            child: const Center(child: Text('Parameters', style: TextStyle(color: Colors.white, fontFamily: 'Digital', fontSize: 18),),),
                          ),
                          const SizedBox(height: 40,),
                          SettingsButton(text: 'Resume', color: sm1, functionToBeUsed: popAndResume,),
                          const SizedBox(height: 10,),
                          SettingsButton(text: 'Replay', color: sm1, functionToBeUsed: popAndReplay,),
                          const SizedBox(height: 10,),
                          SettingsButton(text: 'Quitter', color: sm1, functionToBeUsed: popAndQuit,),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(width: 2, color: Colors.white),
          boxShadow: const [
            BoxShadow(
              color: Colors.greenAccent,
              offset: Offset(0, 6), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(child: Icon(Icons.settings, color: Colors.white,),),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {

  const SettingsButton({Key? key, required this.color, required this.text, required this.functionToBeUsed}) : super(key: key);
  final Color color;
  final String text;
  final void Function() functionToBeUsed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: ()  {
          functionToBeUsed();
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            backgroundColor: color,
            side: const BorderSide(width: 3, color: Colors.white),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
            const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
        child:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Digital',
          ),
        ));
  }
}
