import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/position.dart';
part 'transmitter_model.g.dart';

@HiveType(typeId: 3)
class TransmitterModel extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String transmitterID = "unknown";
  @HiveField(1)
  String transmitterName = "unknown";
  @HiveField(2)
  double transbatteryPercentage = -999;
  @HiveField(3)
  Position position = Position();
  @HiveField(4)
  double signalStrength = -999;
  @HiveField(5)
  double transTemperature = -999;

  void setTransmitterID(String value) {
    transmitterID = value;
    ChangeNotifier();
  }

  void setTransmitterName(String value) {
    transmitterName = value;
    ChangeNotifier();
  }

  void setSignalStrength(double value) {
    signalStrength = value;
    ChangeNotifier();
  }

  void setTransTemperature(double value) {
    transTemperature = value;
    ChangeNotifier();
  }

  void setTransBattery(double value) {
    transbatteryPercentage = value;
    ChangeNotifier();
  }

  String? get getTransmitterID => transmitterID;
  @override
  String toString() {
    return 'TransmitterModel {'
        ' transmitterID: $transmitterID,'
        ' transmitterName: $transmitterName,'
        ' batteryPercentage: $transbatteryPercentage,'
        ' position: $position'
        ' SignalStrength: $signalStrength'
        ' TransTemperature: $transTemperature'
        '}';
  }
}
