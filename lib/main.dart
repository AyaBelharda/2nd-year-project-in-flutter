


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorttrash/Puzzle/Models/TrashCans.dart';
import 'package:sorttrash/Puzzle/main_puzzle.dart';
import 'package:sorttrash/StartPage/choose_children/AddNewPlayer/add_new_player.dart';
import 'package:sorttrash/StartPage/choose_children/choose_child_profile_main.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'package:sorttrash/pages/trophies_page.dart';
import 'package:sorttrash/player_box.dart';
import 'package:sorttrash/profile.dart';
import 'BackEnd/AuthService/verify_user.dart';
import 'BackEnd/PlayerProgress/player.dart';
import 'Puzzle/Models/Objects.dart';
import 'Puzzle/Models/puzzle_management.dart';
import 'Puzzle/puzzle_levels.dart';
import 'StartPage/LoginPage/login_page.dart';
import 'StartPage/RegisterPage/register_page.dart';
import 'StartPage/choose_children/Leader/leader.dart';
import 'StartPage/choose_children/offlineSelection/offline_child_profiles.dart';
import 'StartPage/start_page.dart';
import 'defis/challenge_screen.dart';
import 'histoires/levelsStory.dart';
import 'pages/games.dart';
import 'pages/main_menu.dart';
import 'quiz/NiveauxQuiz.dart';
import 'quiz/managementQuiz.dart';
import 'sort_game/Levels/levels_managment.dart';
import 'conseils/conseils.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter(PlayerProgressAdapter());
  Hive.registerAdapter(LevelsCompletedAdapter());
  Hive.registerAdapter(ParentAdapter());
  playerBox = await Hive.openBox<PlayerProgress>('playerBox');
  parentBox = await Hive.openBox<Parent>('parentBox');
  onlineParentBox = await Hive.openBox<Parent>('onlineParentBox');
  Management man = Management();
  NiveauxQuiz N = NiveauxQuiz(
    nbrNiveax: 5,
    openLevels: 1,
    href: '/',
    levelMangement: man,
  );
  bool decoyMethod(bool te) {
    return false;
  }
  await getProgress();
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    initialRoute:
        '/StartPage', //le widget Niveaux sera utilisé pour l'affichage du niveaux, lors de la construction on lui fais passer le nombre de niveaux aux total et le nombre de niveaux unlocked et le href qui sera un routename pour lier
    routes: {
      '/StartPage': (context) => const StartPage(),
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/AddPlayer' : (context)=> const AddPlayer(),
      '/Niveaux': (context) => Niveaux(
            levelMangement: LevelManagement(),
            NbrNiveax: 5,
            OpenLevels: 1,
            href: '/',
          ),
      '/LeaderBoard' : (context) => const LeaderBoard(),
      '/LoginPage': (context) => const LoginPage(),
      '/ProfilePage': (context) => const ProfilePage(),
      '/RegisterPage': (context) => const RegisterPage(),
      '/VerifyUserEmail': (context) => const VerifyUserEmail(),
      '/OfflineProfilesSelection': (context) => const OfflineProfilesSelection(),
      '/Nquiz': (context) => N,
      '/ChallengesScreen' :(context) => const ChallengesScreen(),
      '/Puzzles': (context) => PuzzleLevels(
        nbrNiveax: 5,
        openLevels: 1,
        levelMangement: PuzzleManagement(),
        href: '/',
      ),
      '/ChildSelector': (context) => const AnonChildSelector(),
      '/TrophiesPage': (context) => const TrophiesPage(),
      '/PuzzleLevel': (context) => PuzzleLevel(
            isLocked: false,
            arrayOfPuzzlePieces: puzzleLevel1Array,
            arrayOfSquares: puzzleArray,
            matrixSSize: 4,
            timeCount: 100,
            changeBooleanStatus: decoyMethod,
            imageName: 'assets/images/puzzle_level1.jpg',
          ),
      '/conseils': (context) => Conseils(),
      "/defis" : (context) => const ChallengesScreen(),
      '/levelsStory': (context) => levelsStory(nbrKeys: 2,),
    },
  ));
}


