import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step6_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';
import '../../cores/components/custom_textfields.dart';

class ConfigStep5Screen extends StatefulWidget {
  const ConfigStep5Screen({super.key});

  @override
  State<ConfigStep5Screen> createState() => _ConfigStep5ScreenState();
}

class _ConfigStep5ScreenState extends State<ConfigStep5Screen> {
  List<String> temperatureOptions = ["Celsius", "Fahrenheit"];
  List<String> distanceOptions = ["Meters", "Feet"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding:
              const EdgeInsets.only(left: 66, right: 66, top: 80, bottom: 72),
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
                      children: [configStepper(5)],
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
                      "5. Configure metric system".text.size(36).bold.make(),
                      87.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: FutureBuilder(
                          future: loadData(),
                          builder: (context, snapshot) {
                            var data = snapshot.data;
                            return Consumer(
                              builder: (context, ConfigProvider config, child) {
                                if (data != null) {
                                  config.distanceMetric = data.distanceMetric;
                                  config.temperatureMetric =
                                      data.temperatureMetric;
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    " Temperature"
                                        .text
                                        .semiBold
                                        .textStyle(GoogleFonts.inter())
                                        .make(),
                                    14.heightBox,
                                    SizedBox(
                                      width: 405,
                                      height: 66,
                                      child: customTextField(
                                          data != null
                                              ? data.temperatureMetric
                                              : config.temperatureMetric,
                                          grayColor,
                                          false,
                                          null,
                                          DropdownButton2(
                                            items: temperatureOptions
                                                .map<DropdownMenuItem<String>>(
                                                    (String tempMetric) =>
                                                        DropdownMenuItem<
                                                                String>(
                                                            value: tempMetric,
                                                            child: tempMetric
                                                                .text
                                                                .size(16)
                                                                .make()))
                                                .toList(),
                                            onChanged: (value) {
                                              config.setTemperatureMetric(
                                                  value ??
                                                      config.temperatureMetric);
                                            },
                                            underline: Container(),
                                            iconStyleData: const IconStyleData(
                                                iconSize: 30),
                                            buttonStyleData:
                                                const ButtonStyleData(
                                                    padding: EdgeInsets.only(
                                              left: 19,
                                              right: 19,
                                            )),
                                            dropdownStyleData:
                                                DropdownStyleData(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              offset: const Offset(-245, -15),
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                          null,
                                          null,
                                          true,
                                          null),
                                    ),
                                    20.heightBox,
                                    " Distance"
                                        .text
                                        .semiBold
                                        .textStyle(GoogleFonts.inter())
                                        .make(),
                                    14.heightBox,
                                    SizedBox(
                                      width: 405,
                                      height: 66,
                                      child: customTextField(
                                          data != null
                                              ? data.distanceMetric
                                              : config.distanceMetric,
                                          grayColor,
                                          false,
                                          null,
                                          DropdownButton2(
                                            items: distanceOptions
                                                .map<DropdownMenuItem<String>>(
                                                    (String distMetric) =>
                                                        DropdownMenuItem<
                                                                String>(
                                                            value: distMetric,
                                                            child: distMetric
                                                                .text
                                                                .size(16)
                                                                .make()))
                                                .toList(),
                                            onChanged: (value) {
                                              config.setDistanceMetric(value ??
                                                  config.distanceMetric);
                                            },
                                            underline: Container(),
                                            iconStyleData: const IconStyleData(
                                                iconSize: 30),
                                            buttonStyleData:
                                                const ButtonStyleData(
                                                    padding: EdgeInsets.only(
                                              left: 19,
                                              right: 19,
                                            )),
                                            dropdownStyleData:
                                                DropdownStyleData(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              offset: const Offset(-260, -15),
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                          null,
                                          null,
                                          true,
                                          null),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      306.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          980.widthBox,
                          SizedBox(
                              width: 188,
                              height: 66,
                              child: customButton("Back", whiteColor,
                                  textGrayColor, grayColor.withOpacity(1), () {
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ConfigStep6Screen()));
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
  }
}
