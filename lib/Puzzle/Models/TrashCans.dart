





class Square{
  final int id;
  late  String imageName;
  Square({
    required this.imageName,
    required this.id,
  });
}

final puzzleArray = List.generate(50, (index) => Square(imageName: "assets/images/empty.png", id: index+ 1));

