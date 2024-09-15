// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transmitter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransmitterModelAdapter extends TypeAdapter<TransmitterModel> {
  @override
  final int typeId = 3;

  @override
  TransmitterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransmitterModel()
      ..transmitterID = fields[0] as String
      ..transmitterName = fields[1] as String
      ..transbatteryPercentage = fields[2] as double
      ..position = fields[3] as Position;
  }

  @override
  void write(BinaryWriter writer, TransmitterModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.transmitterID)
      ..writeByte(1)
      ..write(obj.transmitterName)
      ..writeByte(2)
      ..write(obj.transbatteryPercentage)
      ..writeByte(3)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransmitterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
