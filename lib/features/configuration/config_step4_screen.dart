import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step5_scree.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';
import '../../cores/components/custom_textfields.dart';
import 'package:intl/intl.dart';

class ConfigStep4Screen extends StatefulWidget {
  const ConfigStep4Screen({super.key});

  @override
  State<ConfigStep4Screen> createState() => _ConfigStep4ScreenState();
}

class _ConfigStep4ScreenState extends State<ConfigStep4Screen> {
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

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ConfigProvider config, child) {
        return FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data != null) {
              config.date = data.date;
              config.time = data.time;
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
                              children: [configStepper(4)],
                            )
                          ],
                        ),
                      ),
                      51.heightBox,
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              "4. Configure Date and Time"
                                  .text
                                  .size(36)
                                  .bold
                                  .make(),
                              87.heightBox,
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          data != null ? data.date : datePicked,
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
                                                icon: const Icon(
                                                    Icons.calendar_today)),
                                          ),
                                          null,
                                          null,
                                          true,
                                          null),
                                    ),
                                    20.heightBox,
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
                                          data != null ? data.time : timepicked,
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
                                                icon: const Icon(
                                                    Icons.access_time)),
                                          ),
                                          null,
                                          null,
                                          true,
                                          null),
                                    ),
                                  ],
                                ),
                              ),
                              300.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  980.widthBox,
                                  SizedBox(
                                      width: 188,
                                      height: 66,
                                      child: customButton(
                                          "Back",
                                          whiteColor,
                                          textGrayColor,
                                          grayColor.withOpacity(1), () {
                                        Navigator.pop(context);
                                      })),
                                  24.widthBox,
                                  SizedBox(
                                      width: 188,
                                      height: 66,
                                      child: customButton(
                                          "Save",
                                          primaryColor,
                                          whiteColor,
                                          primaryColor.withOpacity(0.36), () {
                                        if (data != null) {
                                          config = data;
                                          config.notifier();
                                        }

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ConfigStep5Screen()));
                                      }))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
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
