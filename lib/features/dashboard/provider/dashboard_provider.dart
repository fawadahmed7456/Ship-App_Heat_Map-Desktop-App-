import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/shipholds_model.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/tuple_model.dart';

class DashboardProvider with ChangeNotifier {
  int activeHold = 0;
  List<bool> istappedList =
      List.generate(10, (index) => index == 0 ? true : false);
  List<String> tempValues = [];
  List<String> transSecondsData = [];
  List<String> recSecondsData = [];
  List<CustomTuple3> transtuplesList = [];
  List<CustomTuple3> rectuplesList = [];
  List<List<CustomTuple3>> transTuplesData = [];
  List<List<CustomTuple3>> recTuplesData = [];
  List<CustomQuadruple4> lowBatteryTransmittersList = [];
  List<CustomQuadruple4> lowBatteryRecieversList = [];
  List<CustomQuadruple4> highTempTransmittersList = [];
  List<CustomQuadruple4> highTempRecieversList = [];

  void checkTransmitterWarnings(ConfigProvider config) {
    highTempTransmittersList = [];
    lowBatteryRecieversList = [];
    for (int holds = 0; holds < config.shipholds; holds++) {
      for (int transmitters = 0; transmitters < 14; transmitters++) {
        var sensor = config.shipholdsList[holds].transmitterList[transmitters];
        if (sensor.transTemperature > 1) {
          highTempTransmittersList.add(CustomQuadruple4(
              sensor.transmitterName,
              sensor.transTemperature,
              sensor.transbatteryPercentage,
              sensor.signalStrength));
        }
        if (sensor.transbatteryPercentage < 20) {
          lowBatteryTransmittersList.add(CustomQuadruple4(
              sensor.transmitterName,
              sensor.transTemperature,
              sensor.transbatteryPercentage,
              sensor.signalStrength));
        }
      }
    }
  }

  void checkRecieverWarnings(ConfigProvider config) {
    highTempRecieversList = [];
    lowBatteryRecieversList = [];
    for (int holds = 0; holds < config.shipholds; holds++) {
      for (int recievers = 0; recievers < 2; recievers++) {
        var sensor = config.shipholdsList[holds].recieversList[recievers];
        if (sensor.temperature > 1) {
          highTempRecieversList.add(CustomQuadruple4(
              sensor.recieverName,
              sensor.temperature,
              sensor.batteryPercentage,
              sensor.signalStrength));
        }
        if (sensor.batteryPercentage < 20) {
          lowBatteryRecieversList.add(CustomQuadruple4(
              sensor.recieverName,
              sensor.temperature,
              sensor.batteryPercentage,
              sensor.signalStrength));
        }
      }
    }
  }

  Future<List<String>> loadTransSecondsData() async {
    String transData =
        await rootBundle.loadString('assets/data/transmitter_data.csv');
    transSecondsData = transData.split("\n");
    return transSecondsData;
  }

  Future<List<String>> loadRecieverSecondsData() async {
    String recData =
        await rootBundle.loadString('assets/data/reciever_data.csv');
    recSecondsData = recData.split("\n");
    return recSecondsData;
  }

  Future<List<List<CustomTuple3>>> loadTransTuplesData() async {
    transTuplesData = [];
    await loadTransSecondsData();

    for (int seconds = 0; seconds < transSecondsData.length; seconds++) {
      List<String> transData = transSecondsData[seconds].split(",");

      transtuplesList = [];
      for (int tuples = 0; tuples < transData.length; tuples += 3) {
        double value1 = double.parse(transData[tuples]);
        double value2 = double.parse(transData[tuples + 1]);
        double value3 = double.parse(transData[tuples + 2]);

        transtuplesList.add(CustomTuple3(value1, value2, value3));
      }
      transTuplesData.add(transtuplesList);
    }
    return transTuplesData;
  }

  Future<List<List<CustomTuple3>>> loadRecTuplesData() async {
    recTuplesData = [];
    await loadRecieverSecondsData();
    for (int seconds = 0; seconds < recSecondsData.length; seconds++) {
      List<String> recData = recSecondsData[seconds].split(",");

      rectuplesList = [];
      for (int tuples = 0; tuples < recData.length; tuples += 3) {
        double value1 = double.parse(recData[tuples]);
        double value2 = double.parse(recData[tuples + 1]);
        double value3 = double.parse(recData[tuples + 2]);
        rectuplesList.add(CustomTuple3(value1, value2, value3));
      }
      recTuplesData.add(rectuplesList);
    }
    return recTuplesData;
  }

  Future<void> loadTransmittersData(
      List<ShipholdsModel> shipholdsList, ConfigProvider config) async {
    await loadTransTuplesData();
    int secondIndex = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      checkTransmitterWarnings(config);
      if (secondIndex >= transTuplesData.length) {
        timer.cancel(); // Cancel the timer when all data has been processed
        return;
      }

      int holds = 0;
      for (int holdIndex = 0;
          holdIndex < transTuplesData[secondIndex].length;
          holdIndex++) {
        for (int transIndex = 0; transIndex < 14; transIndex++) {
          int transDataIndex = (holds * 14) + transIndex;
          if (transDataIndex >= transTuplesData[secondIndex].length) {
            break; // Break the loop if we exceed the available transmitters
          }
          shipholdsList[holds].transmitterList[transIndex].setTransTemperature(
              convertToTwoDecimalPlaces(
                  transTuplesData[secondIndex][transDataIndex].item1));
          shipholdsList[holds].transmitterList[transIndex].setTransBattery(
              convertToTwoDecimalPlaces(
                  transTuplesData[secondIndex][transDataIndex].item2));
          shipholdsList[holds].transmitterList[transIndex].setSignalStrength(
              convertToTwoDecimalPlaces(
                  transTuplesData[secondIndex][transDataIndex].item3));

          config.notifier();
        }
        holds++;
      }
      secondIndex++;
    });
  }

  Future<void> loadRecieversData(
      List<ShipholdsModel> shipholdsList, ConfigProvider config) async {
    await loadRecTuplesData();
    int secondIndex = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      checkRecieverWarnings(config);
      if (secondIndex >= recTuplesData.length) {
        timer.cancel(); // Cancel the timer when all data has been processed
        return;
      }

      int holds = 0;
      for (int holdIndex = 0;
          holdIndex < recTuplesData[secondIndex].length;
          holdIndex++) {
        for (int recIndex = 0; recIndex < 2; recIndex++) {
          int recDataIndex = (holds * 2) + recIndex;
          if (recDataIndex >= recTuplesData[secondIndex].length) {
            break; // Break the loop if we exceed the available receivers
          }
          shipholdsList[holds].recieversList[recIndex].setRecTemperature(
              convertToTwoDecimalPlaces(
                  recTuplesData[secondIndex][recDataIndex].item1));
          shipholdsList[holds].recieversList[recIndex].setBattery(
              convertToTwoDecimalPlaces(
                  recTuplesData[secondIndex][recDataIndex].item2));
          shipholdsList[holds].recieversList[recIndex].setSignal(
              convertToTwoDecimalPlaces(
                  recTuplesData[secondIndex][recDataIndex].item3));
          config.notifier();
        }
        holds++;
      }
      secondIndex++;
    });
  }

  void setActiveHold(int index, bool value) {
    istappedList[index] = value;
    activeHold = index;
    notifyListeners();
  }

  void notifier() {
    ChangeNotifier();
  }
}
