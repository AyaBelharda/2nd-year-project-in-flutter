
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

import 'package:sorttrash/player_box.dart';
import 'package:uuid/uuid.dart';
import '../../BackEnd/PlayerProgress/player.dart';

class OfflineProfiles extends StatefulWidget {
  const OfflineProfiles({Key? key}) : super(key: key);

  @override
  State<OfflineProfiles> createState() => _OfflineProfilesState();
}

class _OfflineProfilesState extends State<OfflineProfiles> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    if (parentBox.isNotEmpty) {
      Parent test = Parent([], 0, const Uuid().v4().toString());
      test = parentBox.getAt(0);
      offlineProgress.setParent(test);
      offlineProgress.setPlayers(offlineProgress.returnParent().children);
      setState(() {
        offlineGlobalPlayers = test.children;
      });
    } else {
      offlineProgress.setParent(Parent([], 0, const Uuid().v4().toString()));
      parentBox.add(offlineProgress.returnParent());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...offlineGlobalPlayers.map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      globalChildKey = e.childID;
                      onlineGlobalChildKey = -1;
                      offlineProgress.setParent(parentBox.get(0));
                      playerProgress = offlineProgress
                          .returnParent()
                          .children[globalChildKey];
                      FloatingSnackBar(
                        message:
                        '🐧 : Offline Profile Number : $globalChildKey Selected. \n⛔ : Online Profile is Unselected.',
                        context: context,
                        textColor: Colors.black,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Digital',
                            fontSize: 16),
                        duration:
                        const Duration(milliseconds: 1500),
                        backgroundColor: Colors.indigo,
                      );
                    });
                  },
                  child: CircleAvatar(
                    radius: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/profiles/0.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              const InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 50.0,
                  child: Center(
                    child: Icon(Icons.add, size: 50,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
