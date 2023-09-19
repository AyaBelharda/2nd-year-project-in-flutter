
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/player_box.dart';

import '../../../BackEnd/PlayerProgress/player.dart';
import '../../../button.dart';
import '../../../defis/key_container.dart';
import 'online_data_profile_container.dart';

class OnlineProfilesSelection extends StatefulWidget {
  const OnlineProfilesSelection({Key? key}) : super(key: key);

  @override
  State<OnlineProfilesSelection> createState() => _OnlineProfilesSelection();
}

class _OnlineProfilesSelection extends State<OnlineProfilesSelection> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
   _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      await getProgress();
      setState(() {
        playersOnline = onlineProgress.returnPlayers();
      });
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: user == null
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Icon(
                      Icons.wifi_off_sharp,
                      color: Colors.black54,
                      size: 100,
                    ),
                    Text(
                      'Please Sign IN',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.redAccent,
                          fontFamily: 'Digital'),
                    )
                  ],
                ),
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg-image2.png'),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...playersOnline.map((e) => OnlineProfileDataContainer(playerProgress: e)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RoundButton(
                            myIcon: Icons.home,
                            href: '/StartPage',
                            couleur: Colors.greenAccent,
                            shadowColor: Colors.greenAccent,
                          ),
                        const SizedBox(width: 5,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: sm1,
                                side: const BorderSide(width: 3, color: Colors.white),
                                elevation: 0,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding:
                                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
                            onPressed: () {
                              if (onlineGlobalChildKey != -1) {
                                addChild();
                                Navigator.popAndPushNamed(context, '/');
                              } else {
                                FloatingSnackBar(
                                  message:
                                      '📢 : Please Choose A Child Profile! ',
                                  context: context,
                                  textColor: Colors.black,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Digital',
                                      fontSize: 16),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: Colors.redAccent,
                                );
                              }
                            },
                            child: const Text(
                              'Play !',
                              style: TextStyle(
                                fontFamily: 'Digital',
                              ),
                            )),
                        const SizedBox(width: 5,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: sm1,
                                side: const BorderSide(width: 3, color: Colors.white),
                                elevation: 0,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding:
                                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
                            child: const Icon(Icons.add),
                            onPressed: () {
                              Navigator.pushNamed(context, '/AddPlayer');
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

void addChild(){
  onlineProgress.setChild(
      onlineGlobalChildKey,
      PlayerProgress(
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey]
              .score,
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey]
              .gamesData,
          DateTime.now(),
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey]
              .childID,
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey]
              .childsName,
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey]
              .childGlobalUID,
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey].avatarProfileName,
          onlineProgress
              .returnParent()
              .children[onlineGlobalChildKey].lastChallengeDate
      ));
  onlineParentBox.put(onlineProgress.getUID(),
      onlineProgress.returnParent());
  onlineProgress
      .returnParent()
      .updateData(onlineProgress.getUID());

}

void updateChild( String childName, int? childAge, PlayerProgress e){
  onlineProgress
      .updateElementProgress(
      e,
      childName,
      childAge!);
  playersOnline =
      onlineProgress
          .returnPlayers();
  onlineParentBox.put(
      onlineProgress
          .getUID(),
      onlineProgress
          .returnParent());
  onlineProgress
      .returnParent()
      .updateData(
      onlineProgress
          .getUID());
}