import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/histoires/storydesign.dart';

class levelsStory extends StatefulWidget {
  int nbrKeys;
  final List<Widget> histoires = [
    storyDesign(storys: [
      Histoire(
          text:
              "La vie sous-marine Nemo, un petit poisson-clown, et ses amis Dory, une demoiselle bleue étourdie, et Marlin, le père protecteur de Nemo, vivent au milieu des coraux dans l'océan. Ils jouent et s'amusent, heureux de leur vie sous-marine.",
          picture: "assets/images/storys/nemo1.png",
          SoundPath: "music/chap1Nemo.m4a"),
      Histoire(
          text:
              "Nemo et ses amis vivaient heureux dans les coraux de l'océan. Chaque jour, ils jouaient et s'amusaient dans leur petit paradis aquatique. Ils avaient toutes sortes de jeux et de divertissements, comme courir après les bulles, chasser les petits poissons, ou simplement se détendre en admirant la beauté des coraux.",
          picture: "assets/images/storys/nemo2.png",
          SoundPath: "music/chap2Nemo.m4a"),
      Histoire(
          text:
              "Nemo et ses amis ont remarqué la présence de débris de plastique dans leur environnement de corail. Marlin, inquiet, a décidé d'enquêter pour découvrir d'où venait cette pollution. Avec l'aide de ses amis, ils ont suivi les débris de plastique et ont finalement atteint une grande usine sur le bord de l'océan, qui était la source de la pollution.",
          picture: "assets/images/storys/nemo3.png",
          SoundPath: "music/chap3Nemo.m4a"),
      Histoire(
          text:
              "La première tentative de persuasion Nemo et ses amis décident de parler à monsieur Philippe Sherman le chef de l’usine pour le convaincre de cesser de polluer la mer. Ils lui demandent d'arrêter l'usine car jeter les déchets en mer est la solution la moins coûteuse. Mais Philippe refuse.",
          picture: "assets/images/storys/nemo4.png",
          SoundPath: "music/chap4Nemo.m4a"),
      Histoire(
          text:
              "La deuxième tentative de persuasion Nemo et ses amis décident d'essayer une approche différente. Ils suggèrent à Philippe de recycler les déchets au lieu de les jeter en mer. Mais il refuse à cause du coût trop élevé.",
          picture: "assets/images/storys/nemo5.png",
          SoundPath: "music/chap5Nemo.m4a"),
      Histoire(
          text:
              "La troisième tentative de persuasion Nemo et ses amis décident de montrer l'impact de ses actions à Philippe en lui ramenant des jarres d'eau polluée extraite de leur habitat. Il est choqué de voir l'étendue de la pollution et réalise l'importance de protéger l'environnement.",
          picture: "assets/images/storys/nemo6.png",
          SoundPath: "music/chap6Nemo.m4a"),
      Histoire(
          text:
              "La prise de conscience Philippe Sherman réalise qu'il a fait une erreur en polluant la mer. Il décide qu'il doit changer ses méthodes et faire sa part pour protéger l'environnement.",
          picture: "assets/images/storys/nemo7.png",
          SoundPath: "music/chap7Nemo.m4a"),
      Histoire(
          text:
              "Philippe Sherman met en place de nouvelles pratiques pour recycler les déchets de son usine et éviter de polluer la mer.Nemo revient à l'océan pour annoncer la bonne nouvelle à ses amis.",
          picture: "assets/images/storys/nemo8.png",
          SoundPath: "music/chap8Nemo.m4a"),
      Histoire(
          text:
              "La célébration de la victoire Nemo et ses amis célèbrent leur victoire avec tous les animaux de l'océan. Ils sont heureux de voir que leur habitat est plus propre et plus sûr grâce à leur détermination à protéger l'environnement.",
          picture: "assets/images/storys/nemo9.png",
          SoundPath: "music/chap9Nemo.m4a"),
    ]),
  ];
  levelsStory({
    super.key,
    required this.nbrKeys,
  });

  @override
  State<levelsStory> createState() => _levelsStoryState();
}

class _levelsStoryState extends State<levelsStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //le container qui contient le bg image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 0.02 * MediaQuery.of(context).size.height,
          ),
          Row(
            //les bouttons au-dessus
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  child: const Center(
                    child: RoundButton(
                      href: '/',
                      myIcon: Icons.arrow_back,
                      couleur: Color.fromARGB(255, 102, 235, 0),
                      shadowColor: Color.fromARGB(255, 102, 235, 0) ,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5.0, 15.0, 0.0),
                child: Container(
                  //pour creer un alignement des elements
                  height: 60.0,
                  width: 60.0,
                  // color: Colors.amber,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        RoundButton(
                          href: '/',
                          myIcon: Icons.settings,
                          couleur: Color.fromRGBO(255, 210, 23, 5),
                          shadowColor: Color.fromRGBO(255, 210, 23, 5),
                        ), //le premier button
                      ]),
                ),
              ),
            ],
          ),
          Container(
            height: 0.7 * MediaQuery.of(context).size.height,
            width: 0.7 * MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => widget.histoires[0]));
                        },
                        child: Image(
                            image: AssetImage("assets/images/book1.png"))),
                    Image(image: AssetImage("assets/images/book2.png")),
                    Image(image: AssetImage("assets/images/book3.png")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage("assets/images/book4.png")),
                    Image(image: AssetImage("assets/images/book5.png")),
                    Image(image: AssetImage("assets/images/book6.png")),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
