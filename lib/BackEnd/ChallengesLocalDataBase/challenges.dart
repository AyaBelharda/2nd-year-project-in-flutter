



import 'package:hive/hive.dart';

part 'challenges.g.dart';
@HiveType(typeId: 4)
class ChallengesLocalDataBase {
  @HiveField(0)
  late String? challengeInformation;
  @HiveField(1)
  late String? challengeAudio;
  ChallengesLocalDataBase( this.challengeInformation, this.challengeAudio);
  factory ChallengesLocalDataBase.fromJson(Map<String, dynamic> json) {
    return ChallengesLocalDataBase(
      json['challengeInformation'] as String?,
        json['challengeAudio'] as String?
    );
  }
  Map<String, dynamic> toJson() {
    return {
     'challengeInformation' : challengeInformation,
      'challengeAudio' : challengeAudio
    };
  }

}
