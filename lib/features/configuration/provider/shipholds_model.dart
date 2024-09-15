import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/reciever_model.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/transmitter_model.dart';
part 'shipholds_model.g.dart';

@HiveType(typeId: 1)
class ShipholdsModel extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String holdID = "unknown";
  @HiveField(1)
  double maxTemp = -999;
  @HiveField(2)
  double minTemp = -999;
  @HiveField(3)
  List<RecieverModel> recieversList =
      List.generate(2, (index) => RecieverModel());
  @HiveField(4)
  List<TransmitterModel> transmitterList =
      List.generate(14, (index) => TransmitterModel());
  @HiveField(5)
  List<String> sensors = [];
  @HiveField(6)
  List<String> droppedText = List.generate(98, (index) => '');

  void setDroppedText(int index, String value) {
    droppedText[index] = value;
    notifyListeners();
  }

  void setMaxTemp(double value) {
    maxTemp = value;
    notifyListeners();
  }

  void setMinTemp(double value) {
    minTemp = value;
    notifyListeners();
  }

  double get getMaxTemp => maxTemp;

  double get getMinTemp => minTemp;

  @override
  String toString() {
    return 'ShipholdsModel {'
        ' holdID: $holdID,'
        ' maxTemp: $maxTemp,'
        ' minTemp: $minTemp,'
        ' recieversList: $recieversList,'
        ' transmitterList: $transmitterList,'
        ' sensors: $sensors,'
        ' droppedText: $droppedText,'
        '}';
  }
}
