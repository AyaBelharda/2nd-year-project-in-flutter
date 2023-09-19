import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sorttrash/BackEnd/DataBaseService/local_data_base_service.dart';
import 'package:sorttrash/BackEnd/DataBaseService/online_data_base_service.dart';
import 'package:uuid/uuid.dart';


import 'BackEnd/PlayerProgress/player.dart';


int globalChildKey = -1;
int onlineGlobalChildKey = -1;
late Box playerBox;
late Box parentBox;

int currentProfileIndex = 1;
List<PlayerProgress> offlineGlobalPlayers = [];
List<PlayerProgress> playersOnline = [];
late Box onlineParentBox;
DataBaseService offlineProgress = DataBaseService(offlineGlobalPlayers, offlineParent);
Parent offlineParent = Parent([], 0, const Uuid().v4().toString());
Parent onlineParent = Parent([], 0, const Uuid().v4().toString());
PlayerProgress playerProgress = offlineParent.children[globalChildKey];
OnlineDataBaseService onlineProgress = OnlineDataBaseService(playersOnline, onlineParent, decoyUID);
String decoyUID = '';
PlayerProgress globalChildSelector = PlayerProgress(0, DataBaseService.newGameDataPlayer, DateTime.now(), 15, 'childsName', 'childGlobalUID', 'avatarProfileName', DateTime.now());
double globalVolumeMusicSettings = 1;
AssetImage backgroundImage2 =  const AssetImage('assets/images/bg-image2.png');
bool isLoggedInGlobalKey = false;
Future<void> getProgress() async {
  final User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return;
  }

  final hasConnection = await InternetConnectionChecker().hasConnection;

  if (hasConnection) {
    final parent = await onlineParent.fetchParentData(user.uid);

    if (parent != null) {
      onlineProgress.setParent(parent);
      onlineProgress.setUID(user.uid);
      onlineParentBox.put(user.uid, onlineProgress.returnParent());
      onlineProgress.setPlayers(parent.children);
      playersOnline = onlineProgress.returnPlayers();
      return;
    }
  } else {
    if (onlineParentBox.containsKey(user.uid)) {
      onlineProgress.setUID(user.uid);
      onlineProgress.setParent(onlineParentBox.get(user.uid));
      onlineProgress.setPlayers(onlineProgress.returnParent().children);
      playersOnline = onlineProgress.returnPlayers();
      return;
    }
  }
}
