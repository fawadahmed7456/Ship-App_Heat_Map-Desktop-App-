import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';

class SensorGrid extends StatefulWidget {
  const SensorGrid({Key? key}) : super(key: key);

  @override
  State<SensorGrid> createState() => _SensorGridState();
}

class _SensorGridState extends State<SensorGrid> {
  bool isDataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [Image.asset(icRectangleGrid)],
        ),
        Consumer(
          builder: (context, ConfigProvider config, child) => SizedBox(
            width: 458,
            height: 324,
            child: FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                var hiveData = snapshot.data;
                if (hiveData != null) {
                  if (isDataLoaded == false) {
                    config.shipholdsList = hiveData.shipholdsList;
                    isDataLoaded = true;
                  }
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 98,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 14,
                    mainAxisExtent: 46,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    bool isAccepted = false;
                    return GestureDetector(
                      onDoubleTap: () {
                        if (config
                            .shipholdsList[config.activehold].droppedText[index]
                            .contains("Rx")) {
                          config.listOfRecieverList[config.activehold].add(
                              config.shipholdsList[config.activehold]
                                  .droppedText[index]);
                        } else if (config
                            .shipholdsList[config.activehold].droppedText[index]
                            .contains("Tx")) {
                          config.listOfTransmitterList[config.activehold].add(
                              config.shipholdsList[config.activehold]
                                  .droppedText[index]);
                        }
                        config.shipholdsList[config.activehold]
                            .droppedText[index] = "";
                        config.notifier();
                      },
                      child: DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          Color containerColor = accepted.isNotEmpty
                              ? getColor(accepted.first)
                              : config.shipholdsList[config.activehold]
                                      .droppedText[index]
                                      .contains("Rx")
                                  ? Colors.black
                                  : config.shipholdsList[config.activehold]
                                          .droppedText[index]
                                          .contains("Tx")
                                      ? primaryColor
                                      : Colors.transparent;
                          return Container(
                            width: 200,
                            height: 200,
                            color: containerColor,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: textGrayColor, width: 1),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      accepted.isNotEmpty
                                          ? accepted.first
                                          : config
                                              .shipholdsList[config.activehold]
                                              .droppedText[index],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onWillAccept: (data) {
                          return !isAccepted;
                        },
                        onAccept: (data) {
                          // Calculate the row and column
                          int currentRow = index ~/ 14;
                          int currentColumn = index % 14;
                          int activeSensor =
                              (int.parse(data.substring(data.length - 3)) - 1);
                          config.shipholdsList[config.activehold]
                              .setDroppedText(index, data);

                          isAccepted = true;
                          if (data.contains("Tx")) {
                            config.shipholdsList[config.activehold]
                                .transmitterList[activeSensor].position
                                .setRow(currentRow);

                            config.shipholdsList[config.activehold]
                                .transmitterList[activeSensor].position
                                .setCol(currentColumn);
                          }
                          if (data.contains("Rx")) {
                            config.shipholdsList[config.activehold]
                                .recieversList[activeSensor].position
                                .setRow(currentRow);

                            config.shipholdsList[config.activehold]
                                .recieversList[activeSensor].position
                                .setCol(currentColumn);
                            config.notifier();
                          }
                          config.notifier();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Color getColor(String item) {
    return item.contains("Rx") ? Colors.black : primaryColor;
  }
}
