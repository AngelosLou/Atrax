// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveInit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      description: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      repetitiveness: fields[4] as String,
      notifications: (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList(),
      importance: fields[6] as String,
      location: (fields[7] as Map).cast<String, String>(),
      recordingFilePath: fields[8] as String,
      photoFilePath: fields[9] as String,
      friendName: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.repetitiveness)
      ..writeByte(5)
      ..write(obj.notifications)
      ..writeByte(6)
      ..write(obj.importance)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.recordingFilePath)
      ..writeByte(9)
      ..write(obj.photoFilePath)
      ..writeByte(10)
      ..write(obj.friendName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
