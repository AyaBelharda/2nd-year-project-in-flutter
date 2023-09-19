import 'package:sorttrash/BackEnd/DataBaseService/local_data_base_service.dart';
import 'package:sorttrash/player_box.dart';
import 'package:uuid/uuid.dart';

import '../PlayerProgress/player.dart';

class OnlineDataBaseService extends DataBaseService {
  late String _uid;

  OnlineDataBaseService(super.players, super.parent, String uid) {
    _uid = uid;
  }
  @override
  addElementProgress(String childName, int childAge, String profileImage) {
    if (!(childName == '' || childAge >= 100 || childAge <= 3)) {
      int index = 0;
      if (onlineParentBox.isEmpty) {
        onlineParentBox.put(_uid, returnParent());
        index = returnParent().numberOfChildren;
        incrementChildrenCount();
        addChild(PlayerProgress(
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
        setParentChildren(returnPlayers());
        onlineParentBox.put(_uid, returnParent());
      } else {
        setParent(onlineParentBox.get(_uid));
        index = returnParent().numberOfChildren;
        incrementChildrenCount();
        addChild(PlayerProgress(
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
            '$childName-${const Uuid().v4().toString().substring(0, 8)}', profileImage,DateTime.now()));
        setParentChildren(returnPlayers());
        onlineParentBox.put(_uid, returnParent());
      }

    }
  }

  @override
  deleteElementProgress(PlayerProgress playerProgress) {
    try {
      decrementChildrenCount();
      int i = returnPlayers().indexOf(playerProgress);
      removeChild(playerProgress);
      while (i < returnPlayers().length) {
        globalChildKey--;
        decrementChildID(i);
        i++;
      }
      setParentChildren(returnPlayers());
      onlineParentBox.put(_uid, returnParent());
    } catch (e) {
      print(e);
    }
  }

  @override
  updateElementProgress(
      PlayerProgress playerProgress, String childName, int childAge) {
    if (!(childName == '' || childAge >= 100 || childAge <= 3)) {
      playerProgress.childsName = childName;
      removeChild(playerProgress);
      addChild(playerProgress);
      setParent(onlineParentBox.get(_uid));
      setParentChildren(returnPlayers());
      onlineParentBox.put(_uid, returnParent());
    }
  }

  @override
  bool returnLockedState(int index, int levelNumber) {
    try {
      setParent(onlineParentBox.get(_uid));
      playerProgress =
          onlineProgress.returnParent().children[onlineGlobalChildKey];
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

  @override
  bool returnChallengeLockedState(int index, int levelNumber) {
    try {
      setParent(onlineParentBox.get(_uid));
      playerProgress =
      onlineProgress.returnParent().children[onlineGlobalChildKey];
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
  setUID(String uid) {
    _uid = uid;
  }

  String getUID() {
    return _uid;
  }

  appendDataAndSave(Parent parent) {
    try {
      int i = returnParent().children.length;
      int cpt = 0;
      while (cpt < parent.children.length) {
        addChild(PlayerProgress(
            parent.children[cpt].score,
            parent.children[cpt].gamesData,
            parent.children[cpt].lastTimeToJoin,
            i + cpt,
            parent.children[cpt].childsName,
            parent.children[cpt].childGlobalUID, parent.children[cpt].avatarProfileName, parent.children[cpt].lastChallengeDate));
        cpt++;
        incrementChildrenCount();
      }
      setParentChildren(returnPlayers());
    } catch (e) {
      print(e);
    }
  }
}
