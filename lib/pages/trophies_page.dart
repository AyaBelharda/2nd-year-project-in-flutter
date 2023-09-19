import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

import '../BackEnd/PlayerProgress/player.dart';
import '../player_box.dart';

class TrophiesPage extends StatefulWidget {
  const TrophiesPage({Key? key}) : super(key: key);

  @override
  State<TrophiesPage> createState() => _TrophiesPage();
}

class _TrophiesPage extends State<TrophiesPage> {
  late Parent parent = parentBox.getAt(0);
  late GameType gameType;
  late PlayerProgress playerProgress = currentProfileIndex == 1
      ? offlineProgress.returnParent().children[globalChildKey]
      : onlineProgress.returnParent().children[onlineGlobalChildKey];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-image.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 390,
                            width: 500,
                            color: Colors.transparent,
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          left: 190,
                          child: Container(
                              height: 340,
                              width: 400,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white54,
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 8), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlueAccent,
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
                                    'Trophies',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Digital',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        children: [
                                          for (int i = 0;
                                          i < 9;
                                          i++)
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: InkWell(
                                                onTap: (){
                                                  if ( playerProgress.gamesData[(i/3).floor()].levelsCompleted[i%3 +2] == '0' ) {
                                                    FloatingSnackBar(
                                                      message: '📢 : Unlock ${ (i+1) %
                                                          3 ==0 ? 'All Levels' : 'Level: ${i%3 +2}' } of ${getGameType(
                                                          (i / 3).floor()) } ! ',
                                                      context: context,
                                                      textColor: Colors.black,
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Digital',
                                                          fontSize: 16),
                                                      duration: const Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor: Colors
                                                          .redAccent,
                                                    );
                                                  }else{
                                                    FloatingSnackBar(
                                                      message: '🥳 : Unlocked ${ (i+1) %
                                                          3 ==0 ? 'All Levels' : 'Level: ${i%3 +2}' } of ${getGameType(
                                                          (i / 3).floor()) } !',
                                                      context: context,
                                                      textColor: Colors.black,
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Digital',
                                                          fontSize: 16),
                                                      duration: const Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor: Colors
                                                          .greenAccent,
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: playerProgress.gamesData[(i/3).floor()].levelsCompleted[i%3 +2] == '0'? Colors.grey : Colors.white,
                                                      boxShadow:  const [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          spreadRadius: 0,
                                                          blurRadius: 0,
                                                          offset: Offset(4, 4), // changes position of shadow
                                                        ),
                                                      ],
                                                     image: DecorationImage(
                                                       image: AssetImage('assets/images/trophies/${i+1}.png', ), fit: BoxFit.scaleDown,
                                                       colorFilter:  playerProgress.gamesData[(i /3).floor()].levelsCompleted[i%3 +2] == '0'? const ColorFilter.mode( Colors.grey, BlendMode.saturation) : const ColorFilter.mode(Colors.transparent, BlendMode.softLight),
                                                     ),
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                          width: 1, color: Colors.black)),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        )),
                        const Positioned(
                            left: 560,
                            top: 5,
                            child: RoundButton(
                              myIcon: Icons.exit_to_app, href: '/games' , couleur: Color.fromRGBO(255, 210, 23, 5), shadowColor: Colors.transparent,))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
enum GameType {
  puzzle, // 0
  tri,    // 1
  quiz    // 2
}

// A function that takes an integer value and returns the corresponding GameType member

String getGameType(int value) {
  switch(value) {
    case 0:
      return 'Puzzle';
    case 1:
      return 'TRI';
    case 2:
      return 'Quiz';
    default:
      throw ArgumentError("Invalid game type value");
  }
}