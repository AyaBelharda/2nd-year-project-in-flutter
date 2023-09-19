import 'package:sorttrash/player_box.dart';
import 'package:sorttrash/quiz/quizgestes.dart';
import 'package:sorttrash/quiz/quizmultiples.dart';
import 'package:sorttrash/quiz/quizphotos.dart';
import '../BackEnd/DataBaseService/local_data_base_service.dart';
import 'level.dart';

class Management {
  DataBaseService dataBaseService =
      currentProfileIndex == 1 ? offlineProgress : onlineProgress;
  late Level level1 = Level(
      changeBooleanStatus: level2.setIsLocked,
      isLocked: dataBaseService.returnLockedState(0, 2),
      liste:  [
        QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Les boîtes à chaussures vides sont transformées en :",
        photoQuestion: "assets/images/quiz/niveau1/Q1.png",
        reponse1: "Boite de céréales",
        photo1: "assets/images/quiz/niveau1/Q1_1.png",
        reponse2: "Cartons de déménagement",
        photo2: "assets/images/quiz/niveau1/Q1_2.png",
        reponse3: "Papier toilettes",
        photo3: "assets/images/quiz/niveau1/Q1_3.png",
        reponse4: "Sac à dos",
        photo4: "assets/images/quiz/niveau1/Q1_4.png",
        reponseCorrecte: 2,
        explication: "Il est possible que les boîtes à chaussures vides soient transformées en cartons de déménagement, car elles peuvent être de taille pratique pour transporter des objets tels que des livres ou des vêtements. Cependant, les autres options sont également possibles en fonction de l'imagination et des besoins de chacun.",
        SoundPath: "music/n1q1.m4a",
      ),
    ),
    QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Les bouteilles en plastique vides sont transformées en :",
        photoQuestion: "assets/images/quiz/niveau1/Q2.png",
        reponse1: "Veste polaire",
        photo1: "assets/images/quiz/niveau1/Q2_1.png",
        reponse2: "Moquette",
        photo2: "assets/images/quiz/niveau1/Q2_2.png",
        reponse3: "Nourriture",
        photo3: "assets/images/quiz/niveau1/Q2_3.png",
        reponse4: "Nouvelles bouteilles",
        photo4: "assets/images/quiz/niveau1/Q2_4.png",
        reponseCorrecte: 4,
        explication: "Le plastique recyclé est broyé en petits morceaux, nettoyé, fondu, puis transformé en granulés qui peuvent être utilisés pour fabriquer de nouveaux produits en plastique, y compris des bouteilles. Le recyclage des bouteilles en plastique permet d'économiser des matières premières et de réduire la quantité de déchets plastiques qui se retrouvent dans l'environnement.",
        SoundPath: "music/n1q2.m4a",
      ),
    ),
    QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Le vieux matelas est transformé en :",
        photoQuestion: "assets/images/quiz/niveau1/Q3.png",
        reponse1: "Tapis de sport",
        photo1: "assets/images/quiz/niveau1/Q3_1.png",
        reponse2: "Lampe",
        photo2: "assets/images/quiz/niveau1/Q3_2.png",
        reponse3: "Carton",
        photo3: "assets/images/quiz/niveau1/Q3_3.png",
        reponse4: "Siège de voiture",
        photo4: "assets/images/quiz/niveau1/Q3_4.png",
        reponseCorrecte: 1,
        explication: "Le vieux matelas est souvent transformé en tapis de sport car sa texture dense et résistante est idéale pour les activités physiques. Les fabricants de tapis de sport peuvent récupérer la mousse, le latex et les autres matériaux du matelas pour créer un produit de qualité.",
        SoundPath: "music/n1q3.m4a",
      ),
    ),
    QuizPhotosDesign(
      
      quizPhotos: QuizPhotos(
        question: "Les pommes pourries sont transformées en :",
        photoQuestion: "assets/images/quiz/niveau1/Q4.png",
        reponse1: "Compote",
        photo1: "assets/images/quiz/niveau1/Q4_1.png",
        reponse2: "Compost",
        photo2: "assets/images/quiz/niveau1/Q4_2.png",
        reponse3: "Arbre",
        photo3: "assets/images/quiz/niveau1/Q4_3.png",
        reponse4: "Meuble",
        photo4: "assets/images/quiz/niveau1/Q4_4.png",
        reponseCorrecte: 2,
        explication: "Le compostage est un processus naturel de décomposition des déchets organiques qui produit un engrais naturel riche en nutriments pour les plantes. Les pommes pourries et d'autres déchets de cuisine peuvent être ajoutés à un tas de compost ou à un composteur pour se décomposer naturellement et former du compost.",
        SoundPath: "music/n1q4.m4a",
      ),
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand j'ai des documents à imprimer ?",
      photo1: "assets/images/quiz/niveau1/Q5_1.png",
      photo2: "assets/images/quiz/niveau1/Q5_2.png",
      reponseCorrecte: 1,
      explication: "Le bon geste quand on a des documents à imprimer est de n'imprimer que ce qui est nécessaire et d'imprimer en recto verso pour réduire la quantité de papier utilisée. Il est également important de recycler le papier utilisé et de ne pas le jeter à la poubelle.",
      SoundPath: "music/n1q5.m4a",
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand je vais faire les courses ?",
      photo1: "assets/images/quiz/niveau1/Q6_1.png",
      photo2: "assets/images/quiz/niveau1/Q6_2.png",
      reponseCorrecte: 1,
      explication: "Préférez les sacs réutilisables : Au lieu d'utiliser des sacs en plastique jetables, apportez vos propres sacs réutilisables en tissu ou en matériau recyclé",
      SoundPath: "music/n1q6.m4a",
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand mes piles sont déchargées ?",
      photo1: "assets/images/quiz/niveau1/Q7_1.png",
      photo2: "assets/images/quiz/niveau1/Q7_2.png",
      reponseCorrecte: 1,
      explication: "Le bon geste lorsque vos piles sont déchargées est de les déposer dans des bacs de récupération de piles usagées plutôt que de les jeter à la poubelle. Les piles contiennent des métaux lourds tels que le mercure, le plomb et le cadmium, qui peuvent être très polluants et nuire à l'environnement s'ils se retrouvent dans les décharges.",
      SoundPath: "music/n1q7.m4a",
    ),
    const QuizMultiples(
      question: "Que signifie le terme \"recyclage\" ?",
      reponse1: "Transformer des déchets en de nouveaux produits",
      reponse2: "Jeter des déchets dans une décharge",
      reponse3: "Brûler des déchets pour produire de l'énergie",
      reponse4: "Nettoyer l'environnement du déchets",
      reponseCorrecte: 1,
      indication: "Le fait de jeter les déchets ou les brûler est mauvais pour l’environnement, qu’est-ce que vous en pensez ?",
      explication: "Le recyclage est le processus de collecte, de tri, de nettoyage et de transformation des matériaux recyclables en nouveaux produits. Les matériaux recyclables sont des matériaux qui peuvent être transformés en nouveaux produits, tels que le plastique, le papier, le carton, le verre et le métal.",
      SoundPath: "music/n1q8.m4a",
    ),
    const QuizMultiples(
      question: "Avant de commencer le processus de recyclage , on doit trier les ordures selon :",
      reponse1: "La couleur",
      reponse2: "Le type (recyclable ou non)",
      reponse3: "Le volume",
      reponse4: "La matière",
      reponseCorrecte: 2,
      indication: "La nourriture n'est pas recyclable mais les feuilles le sont !",
      explication: "Il existe deux grandes familles de matériaux , la famille des matériaux recyclables c’est-à- dire que nous pouvons les retransformer en matériaux que nous pouvons réutiliser comme les bouteilles d’eau , les  feuilles en papier... et celle des matériaux non-recyclables comme les médicaments , restes de repas , la peinture...",
      SoundPath: "music/n1q10.m4a",
    ),
  ],
      );
  late Level level2 = Level(
      changeBooleanStatus: level3.setIsLocked,
      isLocked: dataBaseService.returnLockedState(1, 2),
      liste: [
        QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Les canettes en aluminium sont transformées en :",
        photoQuestion: "assets/images/quiz/niveau2/Q11.png",
        reponse1: "Trottinette",
        photo1: "assets/images/quiz/niveau2/Q11_1.png",
        reponse2: "Carrelage",
        photo2: "assets/images/quiz/niveau2/Q11_2.png",
        reponse3: "Encadrement de fenêtre",
        photo3: "assets/images/quiz/niveau2/Q11_3.png",
        reponse4: "Pneu",
        photo4: "assets/images/quiz/niveau2/Q11_4.png",
        reponseCorrecte: 1,
        explication: "Les canettes en aluminium peuvent être recyclées pour fabriquer différents produits en aluminium, y compris des trottinettes. Le recyclage des canettes en aluminium est important car il permet d'économiser de l'énergie et des ressources naturelles, tout en réduisant les déchets dans l'environnement.",
        SoundPath: "music/n2q1.m4a"
      ),
    ),
    QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Une collection de journaux est transformée en :",
        photoQuestion: "assets/images/quiz/niveau2/Q12.png",
        reponse1: "Cahier",
        photo1: "assets/images/quiz/niveau2/Q12_1.png",
        reponse2: "Journaux",
        photo2: "assets/images/quiz/niveau2/Q12_2.png",
        reponse3: "Stylo",
        photo3: "assets/images/quiz/niveau2/Q12_3.png",
        reponse4: "Bouteille en plastique",
        photo4: "assets/images/quiz/niveau2/Q12_4.png",
        reponseCorrecte: 2,
        explication: "Une collection de journaux est transformée en papier recyclé pour produire de nouveaux journaux ou d'autres produits en papier tels que des mouchoirs en papier ou des essuie-tout.",
        SoundPath: "music/n2q2.m4a"
      ),
    ),
    QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "Les bidons en plastique sont transformées en :",
        photoQuestion: "assets/images/quiz/niveau2/Q13.png",
        reponse1: "Bac à fleurs ",
        photo1: "assets/images/quiz/niveau2/Q13_1.png",
        reponse2: "L'engrais",
        photo2: "assets/images/quiz/niveau2/Q13_2.png",
        reponse3: "Flacons",
        photo3: "assets/images/quiz/niveau2/Q13_3.png",
        reponse4: "Chaise de jardin",
        photo4: "assets/images/quiz/niveau2/Q13_4.png",
        reponseCorrecte: 4,
        explication: "Les bidons en plastique peuvent être recyclés pour fabriquer une variété de produits en plastique, y compris des chaises de jardin. Le recyclage des bidons en plastique est une façon écologique de les réutiliser au lieu de les jeter dans les décharges où ils prendraient des années à se décomposer",
        SoundPath: "music/n2q3.m4a"
      ),
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand l’ampoule est usagée ?",
      photo1: "assets/images/quiz/niveau2/Q14_1.png",
      photo2: "assets/images/quiz/niveau2/Q14_2.png",
      reponseCorrecte: 1,
      explication: "Le bon geste quand une ampoule est usagée est de la jeter dans une poubelle spéciale pour les déchets dangereux ou de la rapporter dans un magasin ou un centre de recyclage approprié. Les ampoules contiennent des substances toxiques comme le mercure, qui peuvent être nocives pour l'environnement et la santé humaine si elles ne sont pas correctement éliminées.",
      SoundPath: "music/n2q4.m4a",
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand j’épluche un fruit ?",
      photo1: "assets/images/quiz/niveau2/Q15_1.png",
      photo2: "assets/images/quiz/niveau2/Q15_2.png",
      reponseCorrecte: 1,
      explication: "Le bon geste à faire lorsque vous épluchez un fruit est de mettre les épluchures de fruits dans le compost ou le bac à compost si vous en avez un. Les épluchures de fruits sont des déchets organiques qui peuvent être facilement compostés, transformés en un engrais naturel et utilisés pour fertiliser les plantes.",
      SoundPath: "music/n2q5.m4a",
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand je prépare mon goûter ?",
      photo1: "assets/images/quiz/niveau2/Q16_1.png",
      photo2: "assets/images/quiz/niveau2/Q16_2.png",
      reponseCorrecte: 2,
      explication: "Le bon geste pour préparer son goûter de manière écologique est de privilégier les produits locaux, de saison et bio si possible, d'éviter les emballages jetables en optant pour des contenants réutilisables (ex: boîtes en verre, sacs en tissu), et de limiter la consommation de produits transformés qui génèrent souvent plus de déchets. Il est également important de bien gérer ses achats pour éviter le gaspillage alimentaire.",
      SoundPath: "music/n2q6.m4a",
    ),
    const QuizMultiples(
      question: "Quelle est la deuxième étape du recyclage ?",
      reponse1: "La transformation des déchets en nouveaux produits",
      reponse2: "Le transport des déchets vers une usine de recyclage",
      reponse3: "Le stockage temporaire des déchets",
      reponse4: "Le traitement des déchets et les préparer à se transformer",
      reponseCorrecte: 2,
      indication: "On possède maintenant des déchets, qu’est ce qu' on fait champion ?",
      explication: "La deuxième étape du recyclage consiste à transporter les déchets collectés vers une usine de recyclage ou un centre de tri. Cette étape est importante pour garantir la qualité des matériaux recyclables et minimiser les impacts environnementaux liés au transport.",
      SoundPath: "music/n1q7.m4a",
    ),
    const QuizMultiples(
      question: "Quel type de déchet ne peut pas être recyclé ?",
      reponse1: "Le papier et le carton",
      reponse2: "Les sacs en plastique",
      reponse3: "Les boîtes de conserve",
      reponse4: "Les bouteilles en verre",
      reponseCorrecte: 1,
      indication: "Surement c'est un déchet qui pose un problème au niveau de machines de recyclage.",
      explication: "Les sacs en plastique sont généralement fabriqués à partir d'un type de plastique qui n'est pas recyclable, et ils ont tendance à se coincer dans les machines de tri des déchets.",
      SoundPath: "music/n1q8.m4a",
    ),
    const QuizMultiples(
      question: "Quel est l'impact environnemental le plus important du gaspillage alimentaire ?",
      reponse1: "La pollution de l'air",
      reponse2: "La déforestation",
      reponse3: "L'émission de gaz à effet de serre",
      reponse4: "La perte de biodiversité",
      reponseCorrecte: 3,
      indication: "Les déchets alimentaires peuvent être transformés en quelque chose d'utile, comme le compostage.",
      explication: "Le gaspillage alimentaire contribue à l'émission de gaz à effet de serre car les aliments jetés dans les décharges produisent du méthane, un gaz qui contribue au réchauffement climatique. En outre, le gaspillage alimentaire entraîne également une utilisation inutile des ressources naturelles, telles que l'eau et l'énergie, nécessaires pour produire les aliments.",
      SoundPath: "music/n1q9.m4a",
    ),
    const QuizMultiples(
      question: "Quelle est la meilleure façon de réduire les déchets électroniques ?",
      reponse1: "Les recycler correctement",
      reponse2: "Les réparer",
      reponse3: "Les jeter dans les décharges",
      reponse4: "Pratiquer leur location",
      reponseCorrecte: 1,
      indication: "Les téléphones portables sont un exemple de déchets électroniques courants.",
      explication: "La meilleure façon de réduire les déchets électroniques est de les recycler correctement. Les appareils électroniques contiennent souvent des matériaux toxiques qui peuvent être dangereux pour l'environnement s'ils ne sont pas éliminés correctement. Les appareils encore en bon état peuvent également être donnés ou réparés, plutôt que d'être jetés.",
      SoundPath: "music/n1q10.m4a",
      ),
      ],);
  late Level level3 = Level(
      changeBooleanStatus: level4.setIsLocked,
      isLocked: dataBaseService.returnLockedState(2, 2),
      liste: [

      ],);
  late Level level4 = Level(
      changeBooleanStatus: level5.setIsLocked,
      isLocked: dataBaseService.returnLockedState(3, 3),
      liste: [],);
  late Level level5 = Level(
      changeBooleanStatus: decoyMethod,
      isLocked: dataBaseService.returnLockedState(4, 3),
      liste: [],);
  bool decoyMethod(bool te) {
    return false;
  }

  late List<Level> QuizContainer = [level1, level2, level3, level4, level5];
}
