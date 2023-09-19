
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:sorttrash/player_box.dart';

part 'player.g.dart';

@HiveType(typeId: 1)
class PlayerProgress {
  @HiveField(0)
  late int score;
  @HiveField(1)
  late int childID;
  @HiveField(2)
  late List<LevelsCompleted> gamesData;
  @HiveField(3)
  late DateTime lastTimeToJoin;
  @HiveField(4)
  late String? childsName;
  @HiveField(5)
  late String? childGlobalUID;
  @HiveField(6)
  late String? avatarProfileName;
  @HiveField(7)
  late DateTime? lastChallengeDate;
  PlayerProgress(this.score, this.gamesData, this.lastTimeToJoin, this.childID,
      this.childsName, this.childGlobalUID, this.avatarProfileName, this.lastChallengeDate);
  factory PlayerProgress.fromJson(Map<String, dynamic> json) {
    List<dynamic> gamesDataJson = json['gamesData'];
    List<LevelsCompleted> gamesData = gamesDataJson.map((gameJson) => LevelsCompleted.fromJson(gameJson)).toList();
    return PlayerProgress(
      json['score'] as int,
      gamesData,
      DateTime.parse(json['lastTimeToJoin'] as String),
      json['childID'] as int,
      json['childsName'] as String?,
      json['childGlobalUID'] as String?,
      json['avatarProfileName'] as String?,
      DateTime.parse(json['lastChallengeDate'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'childID': childID,
      'gamesData': gamesData.map((game) => game.toJson()).toList(),
      'lastTimeToJoin': lastTimeToJoin.toIso8601String(),
      'childsName': childsName,
      'childGlobalUID': childGlobalUID,
      'avatarProfileName' : avatarProfileName,
      'lastChallengeDate' : lastChallengeDate?.toIso8601String()
    };
  }
}

@HiveType(typeId: 2)
class LevelsCompleted {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String levelsCompleted;
  LevelsCompleted(this.id, this.levelsCompleted);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'levelsCompleted': levelsCompleted,
    };
  }

  factory LevelsCompleted.fromJson(Map<String, dynamic> json) {
    return LevelsCompleted(
      json['id'] as int,
      json['levelsCompleted'] as String,
    );
  }

}

@HiveType(typeId: 3)
class Parent {
  @HiveField(0)
  late List<PlayerProgress> _children = [];

  List<PlayerProgress> get children => _children;

  set children(List<PlayerProgress> value) {
    _children = value;
  }
  @HiveField(1)
  late int _numberOfChildren;
  @HiveField(2)
  late String? parentUUID;
  int get numberOfChildren => _numberOfChildren;

  set numberOfChildren(int value) {
    _numberOfChildren = value;
  }

  Parent(this._children, this._numberOfChildren, this.parentUUID);
   factory Parent.fromJson(Map<String, dynamic> json) {
    var children = (json['children'] as List)
        .map((e) => PlayerProgress.fromJson(e))
        .toList();
    return Parent(children, json['childrenNumber'], json['parentUUID']);
  }
  createData( String uid) {
    final CollectionReference parentCollection =
        FirebaseFirestore.instance.collection('parent');
    final json = {
      "children": children.toList().map((e) => e.toJson()),
      "childrenNumber": numberOfChildren,
      "parentUUID": parentUUID
    };
    parentCollection.doc(uid).set(json);
  }
  Future fetchParentData(String uuid) async {
    try{
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('parent').doc(uuid).get();
      return Parent.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
  }
  Stream<List<Parent>> readParents() => FirebaseFirestore.instance.collection('parent').snapshots().map((event) => event.docs.map((e) => Parent.fromJson(e.data())).toList());
  void updateData(String dataId) {
   try{
     final CollectionReference parentCollection =
     FirebaseFirestore.instance.collection('parent');
     final json = {
       "children": children.toList().map((e) => e.toJson()),
       "childrenNumber": numberOfChildren,
       "parentUUID": parentUUID
     };
     parentCollection.doc(dataId).update(json);
   } catch (e){
     print(e);
   }
  }
  Future<bool> isUserAlreadyLoggedIn() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final snapshot =
    await FirebaseFirestore.instance.collection('parent').doc(user!.uid).get();
    final deviceId = snapshot.data()!['parentUUID'];
    print(deviceId);
    print(parentUUID);
    return deviceId != parentUUID;
  }
  void putOnlineDataToLocal() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      onlineParentBox.put(user.uid, this);
    }
  }
}

