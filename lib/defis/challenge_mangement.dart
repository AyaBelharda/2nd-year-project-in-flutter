




import '../BackEnd/DataBaseService/local_data_base_service.dart';
import '../player_box.dart';
import 'key_container.dart';
int globalChallengeNumberLocatedInChallengeMangement = 0;
class ChallengeManagement {
  DataBaseService dataBaseService = currentProfileIndex == 1? offlineProgress : onlineProgress;
  late List<KeyContainer> challengesList = List.generate(24, (index) =>  KeyContainer(state: dataBaseService.returnLockedState(index, 3), text: '${index+1}',));
}