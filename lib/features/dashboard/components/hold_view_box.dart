import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/selection_widgets/selection_widgets.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HoldViewBox extends StatefulWidget {
  final Color? borderColor;

  const HoldViewBox({Key? key, this.borderColor}) : super(key: key);

  @override
  State<HoldViewBox> createState() => _HoldViewBoxState();
}

class _HoldViewBoxState extends State<HoldViewBox> {
  bool dataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Consumer2(builder:
        (context, ConfigProvider config, DashboardProvider dash, child) {
      if (dataLoaded == false) {
        dash.loadRecieversData(config.shipholdsList, config);
        dash.loadTransmittersData(config.shipholdsList, config);
        dataLoaded = true;
      }

      return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            config.shipholds = data.shipholds;
            config.date = data.date;
            config.time = data.time;
            config.distanceMetric = data.distanceMetric;
            config.temperatureMetric = data.temperatureMetric;
            if (dataLoaded == false) {
              config.shipholdsList = data.shipholdsList;
              dataLoaded = true;
            }
          }
          // print(config.shipholdsList.toString());
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: List.generate(
                config.getShipholds!,
                (holdIndex) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      for (int i = 0; i < 10; i++) {
                        dash.setActiveHold(i, false);
                      }
                      dash.setActiveHold(holdIndex, true);
                      dash.notifier();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: dash.istappedList[holdIndex]
                            ? primaryColor.withOpacity(0.3)
                            : Colors.transparent,
                        border: Border.all(
                            width: 1,
                            color: widget.borderColor ?? textGrayColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          22.heightBox,
                          "Hold ${holdIndex + 1}"
                              .text
                              .size(13)
                              .color(textGrayColor)
                              .semiBold
                              .make(),
                          25.heightBox,
                          Column(
                            children: List.generate(14, (index) {
                              return Container(
                                  height: 21.7,
                                  width: 1000,
                                  decoration: BoxDecoration(
                                    color:
                                        topSideColor1(index, holdIndex, config)
                                            .withOpacity(0.7),
                                    border: Border.all(
                                        width: 0.5,
                                        color: widget.borderColor ??
                                            textGrayColor),
                                  ),
                                  child:
                                      topSideChild1(index, holdIndex, config));
                            }),
                          ),
                          115.heightBox,
                          Column(
                            children: List.generate(
                              7,
                              (index) => Container(
                                height: 28.3,
                                width: 1000,
                                decoration: BoxDecoration(
                                  color: topSideColor2(index, holdIndex, config)
                                      .withOpacity(0.7),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          widget.borderColor ?? textGrayColor),
                                ),
                                child: topSideChild2(index, holdIndex, config),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
