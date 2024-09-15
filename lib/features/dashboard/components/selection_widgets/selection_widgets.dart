import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../cores/colors/colors.dart';
import '../../../configuration/provider/config_provider.dart';
import '../../provider/dashboard_provider.dart';

Widget topSideChild1(int index, int holdIndex, ConfigProvider config) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].recieversList[recIndex].position.col) {
      return "${config.shipholdsList[holdIndex].recieversList[recIndex].recieverID}: ${config.shipholdsList[holdIndex].recieversList[recIndex].temperature}°${config.temperatureMetric[0]}"
          .text
          .size(6)
          .white
          .bold
          .makeCentered();
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].transmitterList[transIndex].position
            .col) {
      return "${config.shipholdsList[holdIndex].transmitterList[transIndex].transmitterID}: ${config.shipholdsList[holdIndex].transmitterList[transIndex].transTemperature}°${config.temperatureMetric[0]}"
          .text
          .size(6)
          .white
          .bold
          .makeCentered();
    }
  }
  return "".text.bold.size(6).white.makeCentered();
}

Widget topSideChild2(int index, int holdIndex, ConfigProvider config) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].recieversList[recIndex].position.row) {
      return "(${config.shipholdsList[holdIndex].recieversList[recIndex].recieverID}): ${config.shipholdsList[holdIndex].recieversList[recIndex].temperature}°${config.temperatureMetric[0]}"
          .text
          .size(6)
          .white
          .bold
          .makeCentered();
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].transmitterList[transIndex].position
            .row) {
      return "(${config.shipholdsList[holdIndex].transmitterList[transIndex].transmitterID}): ${config.shipholdsList[holdIndex].transmitterList[transIndex].transTemperature}°${config.temperatureMetric[0]}"
          .text
          .size(6)
          .white
          .bold
          .makeCentered();
    }
  }
  return "".text.size(6).white.bold.makeCentered();
}

Color topSideColor1(int index, int holdIndex, ConfigProvider config) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].recieversList[recIndex].position.col) {
      double temperature =
          config.shipholdsList[holdIndex].recieversList[recIndex].temperature;
      if (temperature > config.shipholdsList[holdIndex].maxTemp) {
        return Colors.red;
      } else if (temperature >= config.shipholdsList[holdIndex].minTemp) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].transmitterList[transIndex].position
            .col) {
      double temperature = config.shipholdsList[holdIndex]
          .transmitterList[transIndex].transTemperature;
      if (temperature >= 0 && temperature <= 0.3) {
        return Colors.green;
      } else if (temperature > 0.3 && temperature <= 1) {
        return Colors.amber;
      } else if (temperature > 1) {
        return Colors.red;
      }
    }
  }
  return greenHoldColor.withOpacity(0.50);
}

Color topSideColor2(int index, int holdIndex, ConfigProvider config) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].recieversList[recIndex].position.row) {
      double temperature =
          config.shipholdsList[holdIndex].recieversList[recIndex].temperature;
      if (temperature > config.shipholdsList[holdIndex].maxTemp) {
        return Colors.red;
      } else if (temperature >= config.shipholdsList[holdIndex].minTemp) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    if (index ==
        config.shipholdsList[holdIndex].transmitterList[transIndex].position
            .row) {
      double temperature = config.shipholdsList[holdIndex]
          .transmitterList[transIndex].transTemperature;
      if (temperature >= 0 && temperature <= 0.3) {
        return Colors.green;
      } else if (temperature > 0.3 && temperature <= 1) {
        return Colors.amber;
      } else if (temperature > 1) {
        return Colors.red;
      }
    }
  }
  return greenHoldColor.withOpacity(0.50);
}

Widget rearChild1(int currentRow, int currentColumn, ConfigProvider config,
    DashboardProvider dash) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    if (currentRow ==
            config.shipholdsList[dash.activeHold].recieversList[recIndex]
                .position.row &&
        currentColumn ==
            config.shipholdsList[dash.activeHold].recieversList[recIndex]
                .position.col) {
      return Center(
        child:
            "(${config.shipholdsList[dash.activeHold].recieversList[recIndex].recieverID}): ${config.shipholdsList[dash.activeHold].recieversList[recIndex].temperature}°${config.temperatureMetric[0]}"
                .text
                .white
                .size(6)
                .bold
                .make(),
      );
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    if (currentRow ==
            config.shipholdsList[dash.activeHold].transmitterList[transIndex]
                .position.row &&
        currentColumn ==
            config.shipholdsList[dash.activeHold].transmitterList[transIndex]
                .position.col) {
      return Center(
        child:
            "(${config.shipholdsList[dash.activeHold].transmitterList[transIndex].transmitterID}): ${config.shipholdsList[dash.activeHold].transmitterList[transIndex].transTemperature}°${config.temperatureMetric[0]}"
                .text
                .white
                .size(6)
                .bold
                .make(),
      );
    }
  }
  return Center(
    child: "".text.white.size(6).bold.make(),
  );
}

Color rearColor1(int currentRow, int currentColumn, ConfigProvider config,
    DashboardProvider dash) {
  for (int recIndex = 0; recIndex < 2; recIndex++) {
    var receiver =
        config.shipholdsList[dash.activeHold].recieversList[recIndex];
    if (currentRow == receiver.position.row &&
        currentColumn == receiver.position.col) {
      if (receiver.temperature >
          config.shipholdsList[dash.activeHold].maxTemp) {
        return Colors.red;
      } else if (receiver.temperature >=
          config.shipholdsList[dash.activeHold].minTemp) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    }
  }
  for (int transIndex = 0; transIndex < 14; transIndex++) {
    var transmitter =
        config.shipholdsList[dash.activeHold].transmitterList[transIndex];
    if (currentRow == transmitter.position.row &&
        currentColumn == transmitter.position.col) {
      if (transmitter.transTemperature >= 0 &&
          transmitter.transTemperature <= 0.3) {
        return Colors.green;
      } else if (transmitter.transTemperature > 0.3 &&
          transmitter.transTemperature <= 1) {
        return Colors.amber;
      } else if (transmitter.transTemperature > 1) {
        return Colors.red;
      }
    }
  }
  return greenHoldColor.withOpacity(0.5);
}
