enum TrashTypes {
  paperAndCardboard,
  cantBeRecycled,
  plastic,
  metal,
  eWaste,
  organicWaste,
  hazardousWaste
}

class Trash {
  final String imageName;
  final TrashTypes type;
  final int id;
  bool isInCorrectPosition = false;
  Trash({
    required this.imageName,
    required this.type,
    required this.id,
  });
}

final trashArray = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  //*//
  Trash(
    id: 5,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 6,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 7,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 8,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  //**//
  Trash(
    id: 9,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 10,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 11,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 12,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),

  Trash(
    id: 13,
    imageName: "assets/images/e_waste/e21.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 14,
    imageName: "assets/images/e_waste/e22.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 15,
    imageName: "assets/images/e_waste/e23.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 16,
    imageName: "assets/images/e_waste/e24.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 16,
    imageName: "assets/images/e_waste/e25.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 17,
    imageName: "assets/images/plastic/p8.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 18,
    imageName: "assets/images/paper/c4.png",
    type: TrashTypes.paperAndCardboard,
  ),
  Trash(
    id: 19,
    imageName: "assets/images/organic/o7.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 20,
    imageName: "assets/images/organic/o8.png",
    type: TrashTypes.organicWaste,
  ),
];

final trashArrayLeve2 = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  Trash(
    id: 5,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 6,
    imageName: "assets/images/e_waste/e1.png",
    type: TrashTypes.eWaste
  ),
  Trash(
      id: 7,
      imageName: "assets/images/e_waste/e2.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 8,
      imageName: "assets/images/e_waste/e3.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 8,
      imageName: "assets/images/e_waste/e4.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 8,
      imageName: "assets/images/e_waste/e5.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 9,
      imageName: "assets/images/non_recyclable/nr1.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 10,
      imageName: "assets/images/non_recyclable/nr2.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 11,
      imageName: "assets/images/organic/o1.png",
      type: TrashTypes.organicWaste
  ),
  Trash(
      id: 12,
      imageName: "assets/images/organic/o2.png",
      type: TrashTypes.organicWaste
  ),
  Trash(
      id: 13,
      imageName: "assets/images/paper/c1.png",
      type: TrashTypes.paperAndCardboard
  ),
];

final trashArrayLeve3 = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  Trash(
    id: 5,
    imageName: "assets/images/plastic/p1.png",
    type: TrashTypes.plastic,
  ),
  Trash(
      id: 6,
      imageName: "assets/images/organic/o2.png",
      type: TrashTypes.organicWaste
  ),
  Trash(
      id: 7,
      imageName: "assets/images/paper/c1.png",
      type: TrashTypes.paperAndCardboard
  ),
  Trash(
      id: 8,
      imageName: "assets/images/non_recyclable/nr2.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 9,
      imageName: "assets/images/e_waste/e6.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 10,
      imageName: "assets/images/e_waste/e7.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 11,
      imageName: "assets/images/e_waste/e8.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 12,
      imageName: "assets/images/e_waste/e9.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 13,
      imageName: "assets/images/e_waste/e10.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 14,
      imageName: "assets/images/non_recyclable/nr3.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 15,
      imageName: "assets/images/non_recyclable/nr4.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
    id: 16,
    imageName: "assets/images/organic/o3.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 17,
    imageName: "assets/images/organic/o4.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
      id: 18,
      imageName: "assets/images/paper/c2.png",
      type: TrashTypes.paperAndCardboard
  ),
  Trash(
    id: 19,
    imageName: "assets/images/plastic/p2.png",
    type: TrashTypes.plastic,
  ),
];

final trashArrayLevel4 = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  Trash(
    id: 5,
    imageName: "assets/images/plastic/p1.png",
    type: TrashTypes.plastic,
  ),
  Trash(
      id: 6,
      imageName: "assets/images/organic/o2.png",
      type: TrashTypes.organicWaste
  ),
  Trash(
      id: 7,
      imageName: "assets/images/paper/c1.png",
      type: TrashTypes.paperAndCardboard
  ),
  Trash(
      id: 8,
      imageName: "assets/images/non_recyclable/nr2.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 9,
      imageName: "assets/images/e_waste/e6.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 10,
      imageName: "assets/images/e_waste/e7.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 11,
      imageName: "assets/images/e_waste/e8.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 12,
      imageName: "assets/images/e_waste/e9.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 13,
      imageName: "assets/images/e_waste/e11.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 14,
      imageName: "assets/images/e_waste/e12.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 15,
      imageName: "assets/images/e_waste/e13.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 16,
      imageName: "assets/images/e_waste/e14.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 17,
      imageName: "assets/images/e_waste/e15.png",
      type: TrashTypes.eWaste
  ),
  Trash(
      id: 18,
      imageName: "assets/images/non_recyclable/nr4.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
      id: 19,
      imageName: "assets/images/non_recyclable/nr5.png",
      type: TrashTypes.cantBeRecycled
  ),
  Trash(
    id: 20,
    imageName: "assets/images/organic/o4.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 21,
    imageName: "assets/images/organic/o5.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
      id: 22,
      imageName: "assets/images/paper/c2.png",
      type: TrashTypes.paperAndCardboard
  ),
  Trash(
    id: 23,
    imageName: "assets/images/plastic/p2.png",
    type: TrashTypes.plastic,
  ),
  Trash(
      id: 24,
      imageName: "assets/images/paper/c3.png",
      type: TrashTypes.paperAndCardboard
  ),
  Trash(
    id: 25,
    imageName: "assets/images/plastic/p4.png",
    type: TrashTypes.plastic,
  ),
];
final trashArrayLevel5 = [
    trashArray.toList(),
  Trash(
    id: 1,
    imageName: "assets/images/plastic/p6.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/e_waste/e16.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/e_waste/e17.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/e_waste/e18.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 5,
    imageName: "assets/images/e_waste/e19.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 6,
    imageName: "assets/images/e_waste/e20.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 7,
    imageName: "assets/images/organic/o6.png",
    type: TrashTypes.organicWaste,
  ),

];