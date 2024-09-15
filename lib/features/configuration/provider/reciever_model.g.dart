// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciever_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecieverModelAdapter extends TypeAdapter<RecieverModel> {
  @override
  final int typeId = 2;

  @override
  RecieverModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecieverModel()
      ..recieverID = fields[0] as String
      ..recieverName = fields[1] as String
      ..signalStrength = fields[2] as double
      ..batteryPercentage = fields[3] as double
      ..temperature = fields[4] as double
      ..position = fields[5] as Position;
  }

  @override
  void write(BinaryWriter writer, RecieverModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.recieverID)
      ..writeByte(1)
      ..write(obj.recieverName)
      ..writeByte(2)
      ..write(obj.signalStrength)
      ..writeByte(3)
      ..write(obj.batteryPercentage)
      ..writeByte(4)
      ..write(obj.temperature)
      ..writeByte(5)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecieverModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
