// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerProgressAdapter extends TypeAdapter<PlayerProgress> {
  @override
  final int typeId = 1;

  @override
  PlayerProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerProgress(
      fields[0] as int,
      (fields[2] as List).cast<LevelsCompleted>(),
      fields[3] as DateTime,
      fields[1] as int,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerProgress obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.childID)
      ..writeByte(2)
      ..write(obj.gamesData)
      ..writeByte(3)
      ..write(obj.lastTimeToJoin)
      ..writeByte(4)
      ..write(obj.childsName)
      ..writeByte(5)
      ..write(obj.childGlobalUID)
      ..writeByte(6)
      ..write(obj.avatarProfileName)
      ..writeByte(7)
      ..write(obj.lastChallengeDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LevelsCompletedAdapter extends TypeAdapter<LevelsCompleted> {
  @override
  final int typeId = 2;

  @override
  LevelsCompleted read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LevelsCompleted(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LevelsCompleted obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.levelsCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelsCompletedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParentAdapter extends TypeAdapter<Parent> {
  @override
  final int typeId = 3;

  @override
  Parent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Parent(
      (fields[0] as List).cast<PlayerProgress>(),
      fields[1] as int,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Parent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._children)
      ..writeByte(1)
      ..write(obj._numberOfChildren)
      ..writeByte(2)
      ..write(obj.parentUUID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
