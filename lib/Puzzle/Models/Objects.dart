
class Piece {
  final String imageName;
  final int id;
  bool isInCorrectPosition = false;
  Piece({
    required this.imageName,
    required this.id,
  });
}

final puzzleLevel1Array = List.generate(9, (index) => Piece(imageName: "assets/images/puzzle/level1/$index.jpg", id: index + 1));
final puzzleLevel2Array = List.generate(16, (index) => Piece(imageName: "assets/images/puzzle/level2/$index.jpg", id: index + 1));
final puzzleLevel3Array = List.generate(16, (index) => Piece(imageName: "assets/images/puzzle/level3/$index.jpg", id: index + 1));
final puzzleLevel4Array = List.generate(25, (index) => Piece(imageName: "assets/images/puzzle/level4/$index.jpg", id: index + 1));
final puzzleLevel5Array = List.generate(25, (index) => Piece(imageName: "assets/images/puzzle/level5/$index.jpg", id: index + 1));

