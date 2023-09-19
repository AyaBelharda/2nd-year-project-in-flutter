


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/ChallengesLocalDataBase/local_challenges.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/defis/show_challenge_screen.dart';
import '../BackEnd/PlayerProgress/player.dart';
import '../player_box.dart';
import 'challenge_mangement.dart';
import 'key_container.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  final ChallengeManagement challengeManagement = ChallengeManagement();
  final User? user = FirebaseAuth.instance.currentUser;
  late PlayerProgress playerProgress = currentProfileIndex == 1
      ? offlineProgress.returnParent().children[globalChildKey]
      : onlineProgress.returnParent().children[onlineGlobalChildKey];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                 Container(
                   width: 80,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                   child: Row(
                     children:  [
                       const SizedBox(width: 5,),
                       Container(
                         height: 22,
                         width: 30,
                         decoration: const BoxDecoration(
                             image: DecorationImage( image: AssetImage('assets/images/gold_key.png'))
                         ),
                       ),
                       const SizedBox(width: 10,),
                       Text('${_countNumberOfOnesInAString(playerProgress.gamesData[3].levelsCompleted)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Digital', color: sm1 ),)
                     ],
                   ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width - 240,),
                const RoundButton(href: '/', myIcon: Icons.home_filled, couleur: Colors.greenAccent, shadowColor: Colors.greenAccent,),
                const SizedBox(width: 5,),
                const RoundButton(href: '/', myIcon:  Icons.star, couleur: Colors.yellow, shadowColor:  Colors.yellowAccent,),
                const SizedBox(width: 5,),
                const RoundButton(href: '/', myIcon: Icons.settings, couleur: Colors.yellow, shadowColor: Colors.yellowAccent,),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width:  8*0.12*MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio:2.7,
                  child: GridView.count(
                    crossAxisCount: 8,
                    children: [
                      for (int i = 0;
                      i < 24;
                      i++)
                        InkWell(
                             onTap: (){
                               if (playerProgress.lastChallengeDate != null && DateTime.now().isAfter(playerProgress.lastChallengeDate!.add(const Duration(seconds: 100)))){
                                 playerProgress.lastChallengeDate = DateTime.now();
                               }
                               _updateUserData(i + 1);

                               if(!challengeManagement.challengesList[i].state ){
                                 Navigator.of(context).push(
                                     MaterialPageRoute(builder: (context) =>  ShowChallenge(challengeInformation: globalchallengesInformationsList[i]) )
                                 );
                               }
                             }
                            ,child: challengeManagement.challengesList[i])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _updateUserData(int challengeNumber){
    setState(() {
      if ( challengeNumber < playerProgress.gamesData[3].levelsCompleted.length) {
        List<String> characters = playerProgress.gamesData[3]
            .levelsCompleted.split('');
        characters[challengeNumber] = '1';
        playerProgress.gamesData[3].levelsCompleted =
            characters.join('');
      }
    });
    try {
      if (currentProfileIndex == 1) {
        offlineProgress.setChild(globalChildKey, playerProgress);
        if (parentBox.isEmpty) {
          parentBox.add(offlineProgress);
        }else{
          parentBox.putAt(0, offlineProgress.returnParent());
        }
      } else {
        onlineProgress.setChild(onlineGlobalChildKey, playerProgress);
        onlineParentBox.put(user!.uid, onlineProgress.returnParent());
        onlineProgress.returnParent().updateData(onlineProgress.getUID());
      }
    } catch (e) {
      print(e);
    }
  }
  int _countNumberOfOnesInAString(String input) {
    int count = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == '1') {
        count++;
      }
    }
    return count;
  }

}
