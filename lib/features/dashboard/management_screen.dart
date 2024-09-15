import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/components/custom_button.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/rear_view.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/reciever_details.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/side_view.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/transmitter_details.dart';
import 'package:ship_heat_managment_app/features/dashboard/help_and_instructions.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/tuple_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/colors/colors.dart';
import '../../cores/components/custom_textfields.dart';
import 'components/temperature_detials.dart';
import 'components/temperature_warnings.dart';
import 'components/transmitter_warning.dart';
import 'home_screen.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String datePicked = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String timepicked =
        "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}:${DateTime.now().second}";
    Future<void> getDateFromUser() async {
      DateTime? dateData = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2150));

      datePicked = DateFormat('dd/MM/yyyy').format(dateData ?? DateTime.now());
    }

    Future<void> getTimefromUser() async {
      TimeOfDay? timeData =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (timeData != null) {
        timepicked =
            "${timeData.hour}:${timeData.minute}:${DateTime.now().second}";
      } else {
        timepicked =
            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer2(
          builder:
              (context, ConfigProvider config, DashboardProvider dash, child) =>
                  FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (data != null) {
                config.shipholdsList = data.shipholdsList;
              }
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 68, right: 68, top: 68, bottom: 40),
                      child: Column(
                        children: [
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  "Management"
                                      .text
                                      .bold
                                      .size(32)
                                      .textStyle(GoogleFonts.inter())
                                      .color(Colors.black)
                                      .make(),
                                  400.widthBox,
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()));
                                          },
                                          child: "Home"
                                              .text
                                              .size(20)
                                              .color(textGrayColor)
                                              .textStyle(GoogleFonts.inter())
                                              .make()),
                                      58.widthBox,
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ManagementScreen()));
                                          },
                                          child: "Managment"
                                              .text
                                              .size(20)
                                              .color(primaryColor)
                                              .textStyle(GoogleFonts.inter())
                                              .make()),
                                      58.widthBox,
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ConfigStep1Screen()));
                                          },
                                          child: "Edit Configuration"
                                              .text
                                              .size(20)
                                              .color(textGrayColor)
                                              .textStyle(GoogleFonts.inter())
                                              .make()),
                                      58.widthBox,
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HelpAndInstructions()));
                                          },
                                          child: "Help & Instructions"
                                              .text
                                              .size(20)
                                              .color(textGrayColor)
                                              .textStyle(GoogleFonts.inter())
                                              .make()),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          40.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 580,
                                    height: 144,
                                    child: temperatureWarning(CustomQuadruple4(
                                        "item1", -999, -999, -999))),
                                20.widthBox,
                                const SizedBox(
                                    width: 430,
                                    height: 144,
                                    child: TransmitterWarning()),
                                20.widthBox,
                                SizedBox(
                                    width: 316,
                                    height: 144,
                                    child: temperatureDetails(config, dash)),
                              ],
                            ),
                          ),
                          31.heightBox,
                          const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [SideView()])),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 68, right: 68),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 1380, height: 700, child: RearView()),
                        ],
                      ),
                    ),
                  ),
                  80.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 68, right: 68),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              " Time"
                                  .text
                                  .semiBold
                                  .textStyle(GoogleFonts.inter())
                                  .make(),
                              14.heightBox,
                              SizedBox(
                                width: 405,
                                height: 66,
                                child: customTextField(
                                    timepicked,
                                    grayColor,
                                    false,
                                    null,
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: IconButton(
                                          onPressed: () async {
                                            await getTimefromUser();
                                            config.setTime(timepicked);
                                          },
                                          icon: const Icon(Icons.access_time)),
                                    ),
                                    null,
                                    null,
                                    true,
                                    null),
                              ),
                            ],
                          ),
                          35.widthBox,
                          Column(
                            children: [
                              " Date"
                                  .text
                                  .semiBold
                                  .textStyle(GoogleFonts.inter())
                                  .make(),
                              14.heightBox,
                              SizedBox(
                                width: 405,
                                height: 66,
                                child: customTextField(
                                    datePicked,
                                    grayColor,
                                    false,
                                    null,
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: IconButton(
                                          onPressed: () async {
                                            await getDateFromUser();
                                            config.setDate(datePicked);
                                          },
                                          icon:
                                              const Icon(Icons.calendar_today)),
                                    ),
                                    null,
                                    null,
                                    true,
                                    null),
                              ),
                            ],
                          ),
                          80.widthBox,
                          Column(
                            children: [
                              35.heightBox,
                              SizedBox(
                                width: 211,
                                height: 66,
                                child: customButton(
                                    "Update",
                                    primaryColor,
                                    Colors.white,
                                    primaryColor.withOpacity(0.36),
                                    () {}),
                              )
                            ],
                          ),
                          35.widthBox,
                          Column(
                            children: [
                              35.heightBox,
                              SizedBox(
                                width: 211,
                                height: 66,
                                child: customButton(
                                    "Live Data",
                                    grayColor,
                                    textGrayColor,
                                    whiteColor.withOpacity(0.36),
                                    () {}),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 68, right: 68),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          148.heightBox,
                          "Info: Devices"
                              .text
                              .size(32)
                              .textStyle(GoogleFonts.inter())
                              .make(),
                          53.heightBox,
                          SizedBox(
                            width: 1380,
                            height: 320,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 30,
                                      crossAxisSpacing: 40,
                                      mainAxisExtent: 320),
                              itemBuilder: (context, recIndex) {
                                return RecieverDetails(
                                  recieverId: config
                                      .shipholdsList[dash.activeHold]
                                      .recieversList[recIndex]
                                      .recieverName,
                                  recTemperature: config
                                      .shipholdsList[dash.activeHold]
                                      .recieversList[recIndex]
                                      .temperature,
                                  batterPercentage: config
                                      .shipholdsList[dash.activeHold]
                                      .recieversList[recIndex]
                                      .batteryPercentage,
                                  signalStrength: config
                                      .shipholdsList[dash.activeHold]
                                      .recieversList[recIndex]
                                      .signalStrength,
                                  tempMetric: config.temperatureMetric,
                                );
                              },
                            ),
                          ),
                          75.heightBox,
                          "Info: Transmitters"
                              .text
                              .size(32)
                              .textStyle(GoogleFonts.inter())
                              .make(),
                          53.heightBox,
                          SizedBox(
                            height: 1500,
                            width: 1380,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 14,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 30,
                                      crossAxisSpacing: 40,
                                      mainAxisExtent: 260),
                              itemBuilder: (context, transIndex) {
                                return TransmitterDetails(
                                  transmitterID: config
                                      .shipholdsList[dash.activeHold]
                                      .transmitterList[transIndex]
                                      .transmitterName,
                                  batteryPercentage: config
                                      .shipholdsList[dash.activeHold]
                                      .transmitterList[transIndex]
                                      .transbatteryPercentage,
                                  signalStrength: config
                                      .shipholdsList[dash.activeHold]
                                      .transmitterList[transIndex]
                                      .signalStrength,
                                  tempMetric: config.temperatureMetric,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  100.heightBox,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
