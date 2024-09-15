import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/shipholds_model.dart';

import '../components/shipholds_ids.dart';
part 'config_provider.g.dart';

@HiveType(typeId: 0)
class ConfigProvider extends HiveObject with ChangeNotifier {
  @HiveField(0)
  int shipholds = 3;
  @HiveField(1)
  int activehold = 0;
  @HiveField(2)
  String shipholdError = "";
  @HiveField(3)
  List<String> recIdErrorList = ["", ""];
  @HiveField(4)
  List<String> transIdErrorList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ];
  @HiveField(5)
  List<String> maxTempErrorList = ["", "", "", "", "", "", "", "", "", ""];
  @HiveField(6)
  List<String> minTempErrorList = ["", "", "", "", "", "", "", "", "", ""];
  @HiveField(7)
  List<bool> istappedList =
      List.generate(10, (index) => index == 0 ? true : false);
  @HiveField(8)
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @HiveField(9)
  String time =
      "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:${DateTime.now().second}";
  @HiveField(10)
  bool isTempSetupValid = false;
  @HiveField(11)
  String distanceMetric = "Meters";
  @HiveField(12)
  String temperatureMetric = "Celsius";
  @HiveField(13)
  List<ShipholdsModel> shipholdsList =
      List.generate(10, (index) => ShipholdsModel());
  @HiveField(14)
  List<List<String>> listOfRecieverList = [
    List.generate(2, (index) => "H1Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H2Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H3Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H4Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H5Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H6Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H7Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H8Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H9Rx${convertToThreePlaces(index + 1)}"),
    List.generate(2, (index) => "H10Rx${convertToThreePlaces(index + 1)}"),
  ];
  @HiveField(15)
  List<List<String>> listOfTransmitterList = [
    List.generate(14, (index) => "H1Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H2Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H3Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H4Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H5Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H6Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H7Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H8Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H9Tx${convertToThreePlaces(index + 1)}"),
    List.generate(14, (index) => "H10Tx${convertToThreePlaces(index + 1)}"),
  ];

  void setShipholds(int value) {
    shipholds = value;
    notifyListeners();
  }

  void setShipholdError(String value) {
    shipholdError = value;
    notifyListeners();
  }

  void setMaxTempError(int index, String value) {
    maxTempErrorList[index] = value;
    notifyListeners();
  }

  void setMinTempError(int index, String value) {
    minTempErrorList[index] = value;
    notifyListeners();
  }

  void setRecIdError(int index, String value) {
    recIdErrorList[index] = value;
    notifyListeners();
  }

  void setTransIdError(int index, String value) {
    transIdErrorList[index] = value;
    notifyListeners();
  }

  void setActiveHold(int index, bool value) {
    istappedList[index] = value;
    activehold = index;
    notifyListeners();
  }

  void setDate(String value) {
    date = value;
    notifyListeners();
  }

  void setTime(String value) {
    time = value;
    notifyListeners();
  }

  void setDistanceMetric(String value) {
    distanceMetric = value;
    notifyListeners();
  }

  void setTemperatureMetric(String value) {
    temperatureMetric = value;
    notifyListeners();
  }

  String get getTemperatureMetric => temperatureMetric;
  String get getDistanceMetric => distanceMetric;

  String get getdate => date;
  String get gettime => time;

  void notifier() {
    notifyListeners();
  }

  int? get getShipholds => shipholds;

  bool validateShipholds(value) {
    if (value >= 1 && value <= 10) {
      return true;
    } else {
      return false;
    }
  }

  bool validateTemperature(String value) {
    double temp;
    temp = double.tryParse(value) ?? -999;
    if (temp >= -20 && temp <= 200) {
      return true;
    } else {
      return false;
    }
  }

  bool validateHoldIds(value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(value);
  }
}
