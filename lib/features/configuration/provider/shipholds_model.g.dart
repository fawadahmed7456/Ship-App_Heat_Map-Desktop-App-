// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipholds_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShipholdsModelAdapter extends TypeAdapter<ShipholdsModel> {
  @override
  final int typeId = 1;

  @override
  ShipholdsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShipholdsModel()
      ..holdID = fields[0] as String
      ..maxTemp = fields[1] as double
      ..minTemp = fields[2] as double
      ..recieversList = (fields[3] as List).cast<RecieverModel>()
      ..transmitterList = (fields[4] as List).cast<TransmitterModel>()
      ..sensors = (fields[5] as List).cast<String>()
      ..droppedText = (fields[6] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, ShipholdsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.holdID)
      ..writeByte(1)
      ..write(obj.maxTemp)
      ..writeByte(2)
      ..write(obj.minTemp)
      ..writeByte(3)
      ..write(obj.recieversList)
      ..writeByte(4)
      ..write(obj.transmitterList)
      ..writeByte(5)
      ..write(obj.sensors)
      ..writeByte(6)
      ..write(obj.droppedText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShipholdsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
