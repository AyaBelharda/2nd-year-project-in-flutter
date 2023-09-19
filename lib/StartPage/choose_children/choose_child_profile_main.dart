import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/choose_children/Leader/leader.dart';
import 'package:sorttrash/StartPage/choose_children/offlineSelection/offline_child_profiles.dart';
import 'package:sorttrash/StartPage/choose_children/onlineSelection/online_child_profile.dart';
import 'package:sorttrash/player_box.dart';

class AnonChildSelector extends StatefulWidget {
  const AnonChildSelector({super.key, Key? key1}) ;
  @override
  State<AnonChildSelector> createState() => _AnonChildSelector();
}

class _AnonChildSelector extends State<AnonChildSelector> {
  final User? user = FirebaseAuth.instance.currentUser;
  final screens = [
    const OnlineProfilesSelection(),
    const OfflineProfilesSelection(),
    const LeaderBoard()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: currentProfileIndex,
          unselectedItemColor: Colors.black38,
          onTap: (index) => setState(() {
            currentProfileIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.wifi, size: 20, ), label: 'Online Profiles', backgroundColor: Colors.greenAccent),
            BottomNavigationBarItem(icon: Icon(Icons.signal_wifi_connected_no_internet_4_sharp, size: 20,), label: 'Offline', backgroundColor: Colors.redAccent),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard, size: 20,), label: 'LeaderBoard', backgroundColor: Colors.redAccent, ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: IndexedStack(
          index: currentProfileIndex,
          children: screens,
        ),
      )
    );
  }
}

