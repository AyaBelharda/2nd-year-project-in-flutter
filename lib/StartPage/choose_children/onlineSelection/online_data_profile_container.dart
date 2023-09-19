import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sorttrash/player_box.dart';
import '../../../BackEnd/PlayerProgress/player.dart';

class OnlineProfileDataContainer extends StatefulWidget {
  const OnlineProfileDataContainer({Key? key, required this.playerProgress})
      : super(key: key);
  final PlayerProgress playerProgress;

  @override
  State<OnlineProfileDataContainer> createState() =>
      _OnlineProfileDataContainer();
}

class _OnlineProfileDataContainer extends State<OnlineProfileDataContainer> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Center(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 200, right: 200, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 2, color: color), // Set the border color here
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: color),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Icon(
                    Icons.child_care,
                  ),
                  title: Text('UserName : ${widget.playerProgress.childsName} ',
                      style: const TextStyle(fontFamily: 'Digital')),
                  subtitle: Text(
                      'ID: ${widget.playerProgress.childID}  \nLast Time Played :${widget.playerProgress.lastTimeToJoin} ',
                      style: const TextStyle(fontFamily: 'Digital')),
                  trailing: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String childName = '';
                            int? childAge;
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: const Text('Enter Child Information',
                                    style: TextStyle(fontFamily: 'Digital')),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Name'),
                                      onChanged: (value) => childName = value,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) =>
                                          childAge = int.tryParse(value) ?? 0,
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(fontFamily: 'Digital'),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      onlineProgress.setParent(
                                          onlineParentBox.get(user!.uid));
                                      setState(() {
                                        onlineProgress.deleteElementProgress(
                                            widget.playerProgress);
                                        playersOnline =
                                            onlineProgress.returnPlayers();
                                        onlineProgress
                                            .returnParent()
                                            .updateData(
                                                onlineProgress.getUID());
                                      });
                                      onlineParentBox.put(
                                          onlineProgress.getUID(),
                                          onlineProgress.returnParent());
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(fontFamily: 'Digital'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 35,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  _setOnlineChild(widget.playerProgress);
                  FloatingSnackBar(
                    message:
                        '🐧 : Online Profile Number : $onlineGlobalChildKey Selected. \n⛔️ : The Offline Profile is Unselected.',
                    context: context,
                    textColor: Colors.black,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Digital',
                        fontSize: 16),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: Colors.indigo,
                  );
                });
              },
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: color,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(widget.playerProgress.avatarProfileName!),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _setOnlineChild(PlayerProgress playerProgress) {
    onlineGlobalChildKey = widget.playerProgress.childID;
    globalChildKey = -1;
    try {
      onlineProgress.setParent(onlineParentBox.get(user!.uid));
      onlineParentBox.put(
          onlineProgress.getUID(), onlineProgress.returnParent());
      onlineProgress.returnParent().updateData(onlineProgress.getUID());
    } catch (e) {
      print(e);
    }
  }
}
