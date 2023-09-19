import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../BackEnd/PlayerProgress/player.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoard();
}

class _LeaderBoard extends State<LeaderBoard> {
  final User? user = FirebaseAuth.instance.currentUser;
  List<PlayerProgress> leaderScorePlayers = [];
  Parent leaderBoardParent = Parent([], 0,const Uuid().v4().toString());

  @override
  Widget build(BuildContext context) {
    return Material(
      child:  user == null
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
      ) :Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.fill),
        ),
        child: StreamBuilder<List<Parent>>(
          stream: leaderBoardParent.readParents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final parentsData = snapshot.data!;
                leaderScorePlayers = turnParentListToPlayersList(parentsData);
              return Center(
                child: FittedBox(
                  child: Container(
                    height: 340,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...leaderScorePlayers.map((e) => ListTile(
                            leading: const Icon(
                              Icons.child_care,
                            ),
                            title: Text('Childs Name: ${e.childsName}',
                                style:
                                    const TextStyle(fontFamily: 'Digital')),
                            subtitle: Text(
                                'Score  : ${e.score} \nLast Time Played : ${e.lastTimeToJoin} \n UID : ${e.childGlobalUID.toString()}',
                                style:
                                    const TextStyle(fontFamily: 'Digital')),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}

List<PlayerProgress> turnParentListToPlayersList(List<Parent> parents) {
  int i = 0;
  List<PlayerProgress> tempPlayersDataList = [];
  while (i < parents.length) {
    tempPlayersDataList.addAll(parents[i].children);
    i++;
  }
  tempPlayersDataList.sort((a,b) =>b.score.compareTo(a.score));
  return tempPlayersDataList;
}
