

import 'package:hive/hive.dart';

late Box challengesGlobalBox;
List<String> globalchallengesInformationsList =[
'FABRIQUEZ DES PETITS BACS EN CARTON   DE RECYCLAGE ET COLOREZ LES POUR LA MAISON.',
'Utiliser des sacs réutilisables dans votre course.',
'Dirigez-vous vers un parc local et collecter qui peut être recyclé ! Des enfants compétitifs ? Faites-en une course.',
'Prenez Une bouteille de lait ou un contenant de yaourt et essaies de fabriquer des lanceurs de balles.',
'DONNEZ DES JOUETS ET DES VÊTEMENTS AUX ASSOCIATIONS  AULIEU DE LES JETER.',
'Dirigez-vous vers un centre de recyclage local et regardez un peu du processus se dérouler.',
'PRÉPAREZ UN DÉJEUNER SANS DÉCHETS.',
'Démarrez un composteur.',
"Aujourd'hui, Evitez d'utiliser du plastique!",
"organisez un événement de nettoyage communautaire entre enfants du quartier.",
"SI VOUS AVEZ UN OBJET CASSE A LA MAISON, REPAREZ LE.",
"Mangez tout ce qu'il y a dans votre assiette.",
"Evitez de prendre votre goûter avec trop d'emballage",
"Imprimez en recto-verso vos cours",
"Rechargez les piles de vos jouets",
"Découpez des pailles colorées en petits bouts et confectionnez des bracelets votre mère en les enfilant sur des ficelles.",
"Consultez le livre de conseils!",
"TRANSFORMEZ DES JOURNAUX EN BÂTONS DE CONSTRUCTION.",
"Éteignez les lumières avant de vous endormir",
"Essayez d'economiser l'eau",
"Plantez des graines dans votre jardin",
"Éteignez les appareils électroniques",
"Créez des décorations écologiques",
  'FABRIQUEZ DES PETITS BACS EN CARTON   DE RECYCLAGE ET COLOREZ LES POUR LA MAISON.',
  'Utiliser des sacs réutilisables dans votre course.',
  'Dirigez-vous vers un parc local et collecter qui peut être recyclé ! Des enfants compétitifs ? Faites-en une course.',
  'Prenez Une bouteille de lait ou un contenant de yaourt et essaies de fabriquer des lanceurs de balles.',
  'DONNEZ DES JOUETS ET DES VÊTEMENTS AUX ASSOCIATIONS  AULIEU DE LES JETER.',
  'Dirigez-vous vers un centre de recyclage local et regardez un peu du processus se dérouler.',
  'PRÉPAREZ UN DÉJEUNER SANS DÉCHETS.',
  'FABRIQUEZ DES PETITS BACS EN CARTON   DE RECYCLAGE ET COLOREZ LES POUR LA MAISON.',
  'Utiliser des sacs réutilisables dans votre course.',
  'Dirigez-vous vers un parc local et collecter qui peut être recyclé ! Des enfants compétitifs ? Faites-en une course.',
  'Prenez Une bouteille de lait ou un contenant de yaourt et essaies de fabriquer des lanceurs de balles.',
  'DONNEZ DES JOUETS ET DES VÊTEMENTS AUX ASSOCIATIONS  AULIEU DE LES JETER.',
  'Dirigez-vous vers un centre de recyclage local et regardez un peu du processus se dérouler.',
  'PRÉPAREZ UN DÉJEUNER SANS DÉCHETS.',
];

List<Map<String, dynamic>> challengesList = List.generate(globalchallengesInformationsList.length, (index) =>
{
  'challengeInformation' : globalchallengesInformationsList[index],
  'challengeAudio' : 'assets/audio/D${index+1}.m4a'
});



