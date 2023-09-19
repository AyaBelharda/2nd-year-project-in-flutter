import 'package:uuid/uuid.dart';

import '../../player_box.dart';
import '../PlayerProgress/player.dart';

class DataBaseService {
  static final List<LevelsCompleted> newGameDataPlayer = [
    LevelsCompleted(1, '10000000000000'),
    LevelsCompleted(2, '10000000000000'),
    LevelsCompleted(3, '10000000000000'),
    LevelsCompleted(4, '10000000000000'),
  ];
  List<PlayerProgress> _players = [];
  late Parent _parent = Parent([], 0, const Uuid().v4().toString());
  DataBaseService(List<PlayerProgress> players, Parent parent) {
    _parent = parent;
    _players = players;
  }
  addElementProgress(String childName, int childAge, String profileImage) {
    if (!(childName == '' || childAge >= 100 || childAge <= 3)) {
      int index = 0;
      if (parentBox.isEmpty) {
        index = _parent.numberOfChildren;
        _players.add(PlayerProgress(
            0,
            [
              LevelsCompleted(1, '10000000000000'),
              LevelsCompleted(2, '10000000000000'),
              LevelsCompleted(3, '10000000000000'),
              LevelsCompleted(4, '10000000000000'),
            ],
            DateTime.now(),
            index,
            childName,
            '$childName-${const Uuid().v4().toString().substring(0, 8)}',profileImage,DateTime.now()));
        _parent.numberOfChildren++;
        parentBox.add(_parent);
      } else {
        _parent = parentBox.getAt(0);
        index = _parent.numberOfChildren;
        _players.add(PlayerProgress(
            0,
            [
              LevelsCompleted(1, '10000000000000'),
              LevelsCompleted(2, '10000000000000'),
              LevelsCompleted(3, '10000000000000'),
              LevelsCompleted(4, '10000000000000'),
            ],
            DateTime.now(),
            index,
            childName,
            '$childName-${const Uuid().v4().toString().substring(0, 8)}',profileImage,DateTime.now()));
        _parent.children = _players.toList();
        _parent.numberOfChildren++;
        parentBox.putAt(0, _parent);
      }
    }
  }

  bool returnLockedState(int index, int levelNumber) {
    try {
      _parent = parentBox.getAt(0);
      playerProgress = offlineProgress.returnParent().children[globalChildKey];
    } catch (e) {
      print(e);
    }
    if (index < 0 ||
        index >= playerProgress.gamesData[levelNumber].levelsCompleted.length) {
      return true;
    }
    if (playerProgress.gamesData[levelNumber].levelsCompleted[index] == '0') {
      return true;
    } else {
      return false;
    }
  }
  bool returnChallengeLockedState(int index, int levelNumber){
    try {
      _parent = parentBox.getAt(0);
      playerProgress = offlineProgress.returnParent().children[globalChildKey];
    } catch (e) {
      print(e);
    }
    if (index < 0 ||
        index >= playerProgress.gamesData[levelNumber].levelsCompleted.length || playerProgress.lastChallengeDate == null) {
        return true;
    }
    if (playerProgress.gamesData[levelNumber].levelsCompleted[index] == '0') {
      return true;
    } else {
      if (isExactlyOneDayApart(playerProgress.lastChallengeDate!, DateTime.now())){
        return false;
      }
    }
    return true;
  }
  bool isExactlyOneDayApart(DateTime date1, DateTime date2) {
    final difference = date2.difference(date1);
    return difference.inSeconds.abs() == 100;
  }
  deleteElementProgress(PlayerProgress playerProgress) {
    _parent.numberOfChildren--;
    int i = _players.indexOf(playerProgress);
    _players.remove(playerProgress);
    while (i < _players.length) {
      globalChildKey--;
      _players[i].childID--;
      i++;
    }
    _parent.children = _players;
    parentBox.putAt(0, _parent);
  }

  updateElementProgress(
      PlayerProgress playerProgress, String childName, int childAge) {
    if (!(childName == '' || childAge >= 100 || childAge <= 3)) {
      playerProgress.childsName = childName;
      _players.remove(playerProgress);
      _players.add(playerProgress);
      _parent = parentBox.getAt(0);
      _parent.children = _players;
      parentBox.putAt(0, _parent);
    }
  }

  setParent(Parent parent) {
    _parent = parent;
  }

  setPlayers(List<PlayerProgress> players) {
    _players = players;
  }

  Parent returnParent() {
    return _parent;
  }

  List<PlayerProgress> returnPlayers() {
    return _players;
  }

  incrementChildrenCount() {
    _parent.numberOfChildren++;
  }

  decrementChildrenCount() {
    _parent.numberOfChildren--;
  }

  setParentChildren(List<PlayerProgress> children) {
    _parent.children = children;
  }

  addChild(PlayerProgress playerProgress) {
    _players.add(playerProgress);
  }

  removeChild(PlayerProgress playerProgress) {
    _players.remove(playerProgress);
  }

  decrementChildID(int index) {
    try {
      _players[index].childID--;
    } catch (e) {
      print(e);
    }
  }

  setChild(int index, PlayerProgress playerProgress) {
    try {
      _parent.children[index] = playerProgress;
    } catch (e) {
      print(e);
    }
  }
}
