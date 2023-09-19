import 'package:sorttrash/BackEnd/DataBaseService/local_data_base_service.dart';
import 'package:sorttrash/player_box.dart';

import '../Models/Objects.dart';
import '../Models/TrashCans.dart';
import 'Level.dart';

class LevelManagement {
  DataBaseService dataBaseService = currentProfileIndex == 1? offlineProgress : onlineProgress;
  late Level level1 = Level(
    isLocked: dataBaseService.returnLockedState(0,1),
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level2.setIsLocked,
  );
  late Level level2 = Level(
    isLocked: dataBaseService.returnLockedState(1,1),
    arrayOfTrash: trashArrayLeve2,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level3.setIsLocked,
  );

  late Level level3 = Level(
    isLocked: dataBaseService.returnLockedState(2,1),
    arrayOfTrash: trashArrayLeve3,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level4.setIsLocked,
  );

  late Level level4 = Level(
    isLocked: dataBaseService.returnLockedState(3,1),
    arrayOfTrash: trashArrayLevel4,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level5.setIsLocked,
  );

  late Level level5 = Level(
    isLocked: dataBaseService.returnLockedState(4,1),
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: decoyMethod,
  );
  bool decoyMethod(bool te) {
    return false;
  }

  late List<Level> levelsContainer = [level1, level2, level3, level4, level5];
}
