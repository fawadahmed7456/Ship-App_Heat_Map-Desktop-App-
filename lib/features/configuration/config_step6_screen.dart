import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/components/hold_box.dart';
import 'package:ship_heat_managment_app/features/configuration/components/sensor_grid.dart';
import 'package:ship_heat_managment_app/features/configuration/components/shipholds_ids.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';

class ConfigStep6Screen extends StatefulWidget {
  const ConfigStep6Screen({Key? key}) : super(key: key);

  @override
  State<ConfigStep6Screen> createState() => _ConfigStep6ScreenState();
}

class _ConfigStep6ScreenState extends State<ConfigStep6Screen> {
  late bool errorDetected;
  bool isDataLoaded = false;
  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: 635,
            height: 343,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 70,
                    color: blackColor.withOpacity(0.40),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 84, right: 84, top: 22, bottom: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(icWarning),
                    "Settings not Saved!"
                        .text
                        .bold
                        .textStyle(GoogleFonts.inter())
                        .size(32)
                        .color(Colors.black)
                        .make(),
                    8.heightBox,
                    "Are you sure you want to go back to dashboard"
                        .text
                        .size(20)
                        .color(textGrayColor)
                        .textStyle(GoogleFonts.inter())
                        .make(),
                    "    without saving configurations"
                        .text
                        .size(20)
                        .color(textGrayColor)
                        .textStyle(GoogleFonts.inter())
                        .make(),
                    25.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 148,
                          height: 66,
                          child: customButton(
                            "No",
                            whiteColor,
                            textGrayColor,
                            grayColor,
                            () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        24.widthBox,
                        SizedBox(
                          width: 148,
                          height: 66,
                          child: customButton(
                            "Yes",
                            primaryColor,
                            Colors.white,
                            primaryColor.withOpacity(0.36),
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        var data = snapshot.data;

        return Consumer(
          builder: (context, ConfigProvider config, child) {
            if (data != null) {
              if (isDataLoaded == false) {
                config.listOfRecieverList = data.listOfRecieverList;
                config.listOfTransmitterList = data.listOfTransmitterList;
                isDataLoaded = true;
              }
            }
            return Scaffold(
              backgroundColor: whiteColor,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 66, right: 66, top: 80, bottom: 72),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Configuration"
                                    .text
                                    .size(32)
                                    .textStyle(GoogleFonts.inter())
                                    .bold
                                    .black
                                    .make(),
                                "Please enter your ship details for set up"
                                    .text
                                    .size(16)
                                    .textStyle(GoogleFonts.inter())
                                    .color(textGrayColor)
                                    .make(),
                              ],
                            ),
                            750.widthBox,
                            Row(
                              children: [configStepper(6)],
                            ),
                          ],
                        ),
                      ),
                      51.heightBox,
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              "6. Device locations".text.size(36).bold.make(),
                              38.heightBox,
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: 406,
                                              height: 468,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 70,
                                                      offset:
                                                          const Offset(0, 4),
                                                      color: blackColor
                                                          .withOpacity(0.11),
                                                    ),
                                                  ],
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(icShipTop),
                                                    Image.asset(icShipSide),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 406,
                                              height: 468,
                                              child: HoldBox(
                                                  borderColor: textGrayColor),
                                            ),
                                          ],
                                        ),
                                        74.widthBox,
                                        const SizedBox(
                                          width: 459,
                                          height: 324,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [SensorGrid()],
                                          ),
                                        ),
                                        75.widthBox,
                                        SizedBox(
                                          width: 307,
                                          height: 468,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: const Offset(0, 4),
                                                  blurRadius: 70,
                                                  color: blackColor
                                                      .withOpacity(0.11),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                13.heightBox,
                                                Center(
                                                  child:
                                                      "Drag & Drop".text.make(),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 27,
                                                          right: 24,
                                                          top: 18,
                                                          bottom: 21),
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 395,
                                                            width: 300,
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 50,
                                                                  width: 400,
                                                                  child: GridView
                                                                      .builder(
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      mainAxisExtent:
                                                                          39,
                                                                      mainAxisSpacing:
                                                                          11,
                                                                      crossAxisSpacing:
                                                                          11,
                                                                      crossAxisCount:
                                                                          2,
                                                                    ),
                                                                    itemCount: config
                                                                        .listOfRecieverList[
                                                                            config.activehold]
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Draggable(
                                                                        data: config.listOfRecieverList[config.activehold]
                                                                            [
                                                                            index],
                                                                        feedback:
                                                                            Container(
                                                                          width:
                                                                              121,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.black.withOpacity(0.5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                config.listOfRecieverList[config.activehold][index].text.size(10).color(Colors.white).make(),
                                                                          ),
                                                                        ),
                                                                        childWhenDragging:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              121,
                                                                          width:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.black,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                config.listOfRecieverList[config.activehold][index].text.color(Colors.white).make(),
                                                                          ),
                                                                        ),
                                                                        onDragCompleted:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            config.listOfRecieverList[config.activehold].removeAt(index);
                                                                            config.notifier();
                                                                          });
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 345,
                                                                  width: 400,
                                                                  child: GridView
                                                                      .builder(
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      mainAxisExtent:
                                                                          39,
                                                                      mainAxisSpacing:
                                                                          10,
                                                                      crossAxisSpacing:
                                                                          11,
                                                                      crossAxisCount:
                                                                          2,
                                                                    ),
                                                                    itemCount: config
                                                                        .listOfTransmitterList[
                                                                            config.activehold]
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Draggable(
                                                                        data: config.listOfTransmitterList[config.activehold]
                                                                            [
                                                                            index],
                                                                        feedback:
                                                                            Container(
                                                                          width:
                                                                              121,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                primaryColor.withOpacity(0.5),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                config.listOfTransmitterList[config.activehold][index].text.size(10).color(Colors.white).make(),
                                                                          ),
                                                                        ),
                                                                        childWhenDragging:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              121,
                                                                          width:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                config.listOfTransmitterList[config.activehold][index].text.color(Colors.white).make(),
                                                                          ),
                                                                        ),
                                                                        onDragCompleted:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            config.listOfTransmitterList[config.activehold].removeAt(index);
                                                                            config.notifier();
                                                                          });
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              106.heightBox,
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 323,
                                        height: 66,
                                        child: customButton(
                                            "Back to Dashboard",
                                            Colors.black,
                                            whiteColor,
                                            whiteColor, () {
                                          showConfirmationDialog(context);
                                        }),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      657.widthBox,
                                      SizedBox(
                                        width: 188,
                                        height: 66,
                                        child: customButton(
                                            "Clear",
                                            whiteColor,
                                            textGrayColor,
                                            grayColor.withOpacity(1), () {
                                          config.listOfRecieverList = [
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H1Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H2Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H3Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H4Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H5Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H6Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H7Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H8Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H9Rx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                2,
                                                (index) =>
                                                    "H10Rx${convertToThreePlaces(index + 1)}"),
                                          ];

                                          config.listOfTransmitterList = [
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H1Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H2Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H3Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H4Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H5Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H6Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H7Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H8Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H9Tx${convertToThreePlaces(index + 1)}"),
                                            List.generate(
                                                14,
                                                (index) =>
                                                    "H10Tx${convertToThreePlaces(index + 1)}"),
                                          ];
                                          for (int holds = 0;
                                              holds < 10;
                                              holds++) {
                                            config.shipholdsList[holds]
                                                    .droppedText =
                                                List.generate(
                                                    98, (index) => '');
                                            config.notifier();
                                          }
                                          config.notifier();
                                        }),
                                      ),
                                      24.widthBox,
                                      SizedBox(
                                        width: 188,
                                        height: 66,
                                        child: FutureBuilder(
                                          future: loadData(),
                                          builder: (context, snapshot) {
                                            return customButton(
                                                "Save",
                                                primaryColor,
                                                whiteColor,
                                                primaryColor.withOpacity(0.36),
                                                () async {
                                              errorDetected = false;
                                              for (int holds = 0;
                                                  holds < config.shipholds;
                                                  holds++) {
                                                if (config
                                                        .listOfRecieverList[
                                                            holds]
                                                        .isNotEmpty ||
                                                    config
                                                        .listOfTransmitterList[
                                                            holds]
                                                        .isNotEmpty) {
                                                  errorDetected = true;
                                                  VxToast.show(context,
                                                      msg:
                                                          "All sensors are needed to be placed to proceed!");
                                                }
                                              }
                                              if (!errorDetected) {
                                                var configBox = await Hive
                                                    .openBox<ConfigProvider>(
                                                        "config2");

                                                configBox.put(
                                                    "final_config", config);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomeScreen()));
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
