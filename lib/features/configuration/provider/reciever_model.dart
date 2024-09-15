import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/position.dart';
part 'reciever_model.g.dart';

@HiveType(typeId: 2)
class RecieverModel extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String recieverID = "unknown";
  @HiveField(1)
  String recieverName = "unknown";
  @HiveField(2)
  double signalStrength = -999;
  @HiveField(3)
  double batteryPercentage = -999;
  @HiveField(4)
  double temperature = -999;
  @HiveField(5)
  Position position = Position();

  void setReceiverID(String value) {
    recieverID = value;
    notifyListeners();
  }

  void setReceiverName(String value) {
    recieverName = value;
    notifyListeners();
  }

  void setBattery(double value) {
    batteryPercentage = value;
    notifyListeners();
  }

  void setSignal(double value) {
    signalStrength = value;
    notifyListeners();
  }

  void setRecTemperature(double value) {
    temperature = value;
    notifyListeners();
  }

  String? get getRecieverID => recieverID;

  @override
  String toString() {
    return 'RecieverModel {'
        ' recieverID: $recieverID,'
        ' recieverName: $recieverName,'
        ' signalStrength: $signalStrength,'
        ' batteryPercentage: $batteryPercentage,'
        ' temperature: $temperature,'
        ' position: $position'
        '}';
  }
}
