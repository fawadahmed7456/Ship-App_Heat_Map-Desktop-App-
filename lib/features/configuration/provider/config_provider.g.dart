// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigProviderAdapter extends TypeAdapter<ConfigProvider> {
  @override
  final int typeId = 0;

  @override
  ConfigProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigProvider()
      ..shipholds = fields[0] as int
      ..activehold = fields[1] as int
      ..shipholdError = fields[2] as String
      ..recIdErrorList = (fields[3] as List).cast<String>()
      ..transIdErrorList = (fields[4] as List).cast<String>()
      ..maxTempErrorList = (fields[5] as List).cast<String>()
      ..minTempErrorList = (fields[6] as List).cast<String>()
      ..istappedList = (fields[7] as List).cast<bool>()
      ..date = fields[8] as String
      ..time = fields[9] as String
      ..isTempSetupValid = fields[10] as bool
      ..distanceMetric = fields[11] as String
      ..temperatureMetric = fields[12] as String
      ..shipholdsList = (fields[13] as List).cast<ShipholdsModel>()
      ..listOfRecieverList = (fields[14] as List)
          .map((dynamic e) => (e as List).cast<String>())
          .toList()
      ..listOfTransmitterList = (fields[15] as List)
          .map((dynamic e) => (e as List).cast<String>())
          .toList();
  }

  @override
  void write(BinaryWriter writer, ConfigProvider obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.shipholds)
      ..writeByte(1)
      ..write(obj.activehold)
      ..writeByte(2)
      ..write(obj.shipholdError)
      ..writeByte(3)
      ..write(obj.recIdErrorList)
      ..writeByte(4)
      ..write(obj.transIdErrorList)
      ..writeByte(5)
      ..write(obj.maxTempErrorList)
      ..writeByte(6)
      ..write(obj.minTempErrorList)
      ..writeByte(7)
      ..write(obj.istappedList)
      ..writeByte(8)
      ..write(obj.date)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.isTempSetupValid)
      ..writeByte(11)
      ..write(obj.distanceMetric)
      ..writeByte(12)
      ..write(obj.temperatureMetric)
      ..writeByte(13)
      ..write(obj.shipholdsList)
      ..writeByte(14)
      ..write(obj.listOfRecieverList)
      ..writeByte(15)
      ..write(obj.listOfTransmitterList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
