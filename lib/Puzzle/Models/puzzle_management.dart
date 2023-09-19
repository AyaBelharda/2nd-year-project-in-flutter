

import 'package:sorttrash/Puzzle/main_puzzle.dart';
import 'package:sorttrash/player_box.dart';
import '../../BackEnd/DataBaseService/local_data_base_service.dart';
import 'Objects.dart';
import 'TrashCans.dart';
int puzzleNumber = 1;
class PuzzleManagement{
  DataBaseService dataBaseService = currentProfileIndex == 1? offlineProgress : onlineProgress;
  late PuzzleLevel level1 = PuzzleLevel(
    isLocked: dataBaseService.returnLockedState(0,0) ,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 3,
    timeCount: 100,
    changeBooleanStatus: level2.setIsLocked, imageName: 'assets/images/puzzle_level1.jpg',
  );
  late PuzzleLevel level2 = PuzzleLevel(
    isLocked: dataBaseService.returnLockedState(1,0),
    arrayOfPuzzlePieces: puzzleLevel2Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 120,
    changeBooleanStatus: level3.setIsLocked, imageName: 'assets/images/puzzle_level2.jpg',
  );
  late PuzzleLevel level3 = PuzzleLevel(
    isLocked: dataBaseService.returnLockedState(2,0),
    arrayOfPuzzlePieces: puzzleLevel3Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: level4.setIsLocked, imageName: 'assets/images/puzzle_level3.jpg',
  );
  late PuzzleLevel level4 = PuzzleLevel(
    isLocked: dataBaseService.returnLockedState(3,0),
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 5,
    timeCount: 120,
    changeBooleanStatus: level5.setIsLocked, imageName: 'assets/images/puzzle_level4.jpg',
  );
  late PuzzleLevel level5 = PuzzleLevel(
    isLocked: dataBaseService.returnLockedState(4,0),
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 5,
    timeCount: 100,
    changeBooleanStatus: decoyMethod, imageName: 'assets/images/puzzle_level5.jpg',
  );
  bool decoyMethod(bool te) {
    return false;
  }
  late List<PuzzleLevel> levelsContainer = [level1, level2, level3, level4, level5];
}