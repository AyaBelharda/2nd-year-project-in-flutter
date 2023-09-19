



import 'Objects.dart';

enum TrashCanTypes { green, yellow, red, gray, blue, orange }

class TrashCan{
  final String imageName;
  final TrashCanTypes type;
  final List<TrashTypes> trashToGoThrough ;
  final int id;
  TrashCan({
    required this.trashToGoThrough,
    required this.imageName,
    required this.type,
    required this.id,
  });
}

final trashCansArray = [
  TrashCan(
    id: 1,
    trashToGoThrough: [TrashTypes.cantBeRecycled],
    imageName: "assets/images/green.png",
    type: TrashCanTypes.green,
  ),
  TrashCan(
    id: 2,
    trashToGoThrough: [ TrashTypes.paperAndCardboard ],
    imageName: "assets/images/blue.png",
    type: TrashCanTypes.blue,
  ),
  TrashCan(
    id: 3,
    trashToGoThrough: [TrashTypes.eWaste],
    imageName: "assets/images/red.png",
    type: TrashCanTypes.red,
  ),
  TrashCan(
    id: 5,
    trashToGoThrough: [TrashTypes.plastic],
    imageName: "assets/images/orange.png",
    type: TrashCanTypes.orange,
  ),
  TrashCan(
    id: 6,
    trashToGoThrough: [TrashTypes.organicWaste],
    imageName: "assets/images/gray.png",
    type: TrashCanTypes.gray,
  ),

];

