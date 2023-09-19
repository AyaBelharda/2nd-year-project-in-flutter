
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sorttrash/player_box.dart';
import '../../../BackEnd/PlayerProgress/player.dart';

class OfflineProfileDataContainer extends StatefulWidget {
  const OfflineProfileDataContainer({
    Key? key,
    required this.playerProgress
  }) : super(key: key);
  final PlayerProgress playerProgress;

  @override
  State<OfflineProfileDataContainer> createState() => _OfflineProfileDataContainerState();
}


class _OfflineProfileDataContainerState extends State<OfflineProfileDataContainer> {
  @override
  Widget build(BuildContext context) {
    final color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Center(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(left: 0.26*MediaQuery.of(context).size.width, right:0.26* MediaQuery.of(context).size.width, top: 0.06*MediaQuery.of(context).size.height),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: color), // Set the border color here
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side:  BorderSide(width: 2, color:color),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Icon(
                    Icons.child_care,
                  ),

                  title:
                  Text('UserName : ${widget.playerProgress.childsName} ', style: const TextStyle(fontFamily: 'Digital')),
                  subtitle:  Text('ID: ${widget.playerProgress.childID}  \nLast Time Played :${widget.playerProgress.lastTimeToJoin} ',
                      style: const TextStyle(fontFamily: 'Digital')),
                  trailing: const Icon(Icons.edit, size: 35,),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.22*MediaQuery.of(context).size.width,
            top: 0.06*MediaQuery.of(context).size.height,
            child: InkWell(
              onTap: () {
                setState(() {
                  _setOfflineChild(widget.playerProgress);
                  FloatingSnackBar(
                    message:
                    '🐧 : Offline Profile Number : $globalChildKey Selected. \n⛔ : Online Profile is Unselected.',
                    context: context,
                    textColor: Colors.black,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Digital',
                        fontSize: 16),
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: Colors.indigo,
                  );
                });
              },
              child: CircleAvatar(
                radius: 45,
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
  void _setOfflineChild(PlayerProgress playerProgress){
    globalChildKey = playerProgress.childID;
    onlineGlobalChildKey = -1;
    offlineProgress.setParent(parentBox.get(0));
    playerProgress = offlineProgress
        .returnParent()
        .children[globalChildKey];
  }
}
