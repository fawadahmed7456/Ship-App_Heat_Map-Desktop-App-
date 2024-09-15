import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/components/shipholds_ids.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step3_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';

class ConfigStep2Screen extends StatefulWidget {
  const ConfigStep2Screen({super.key});

  @override
  State<ConfigStep2Screen> createState() => _ConfigStep2ScreenState();
}

class _ConfigStep2ScreenState extends State<ConfigStep2Screen> {
  int shipHolds = 3;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ConfigProvider config, child) => Scaffold(
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
                        children: [configStepper(2)],
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
                        "2. For each hold configure the receiver and transmitter ID’s"
                            .text
                            .size(36)
                            .bold
                            .make(),
                        70.heightBox,
                        const SizedBox(
                          width: 660,
                          height: 360,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ShipholdIDs(),
                              ],
                            ),
                          ),
                        ),
                        190.heightBox,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConfigStep3Screen()));
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
      ),
    );
  }
}
