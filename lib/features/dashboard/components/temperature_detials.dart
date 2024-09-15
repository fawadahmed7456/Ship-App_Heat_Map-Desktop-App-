import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:velocity_x/velocity_x.dart';

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

@override
Widget temperatureDetails(ConfigProvider config, DashboardProvider dash) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 70,
              color: blackColor.withOpacity(0.11))
        ]),
    child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
      child: Row(
        children: [
          28.widthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateFormat.jm().format(DateTime.now()).text.size(24).bold.make(),
              Row(children: [
                "Min : ".text.size(20).make(),
                "${config.shipholdsList[dash.activeHold].getMinTemp}° C / ${celsiusToFahrenheit(config.shipholdsList[dash.activeHold].getMinTemp)}° F"
                    .text
                    .size(20)
                    .make()
              ]),
              Row(children: [
                "Max : ".text.size(20).make(),
                "${config.shipholdsList[dash.activeHold].getMaxTemp}° C / ${celsiusToFahrenheit(config.shipholdsList[dash.activeHold].getMaxTemp)}° F"
                    .text
                    .size(20)
                    .make()
              ]),
            ],
          )
        ],
      ),
    ),
  );
}
