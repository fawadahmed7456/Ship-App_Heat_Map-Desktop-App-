import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/components/shipholds_thresholds.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step4_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../cores/components/custom_button.dart';

class ConfigStep3Screen extends StatefulWidget {
  const ConfigStep3Screen({super.key});

  @override
  State<ConfigStep3Screen> createState() => _ConfigStep3ScreenState();
}

class _ConfigStep3ScreenState extends State<ConfigStep3Screen> {
  bool isDataLoaded = false;
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
                      children: [configStepper(3)],
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
                      "3. Set the gradient thresholds for each hold."
                          .text
                          .size(36)
                          .bold
                          .make(),
                      70.heightBox,
                      const SizedBox(
                        width: 675,
                        height: 360,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ShipholdThresholds(),
                            ],
                          ),
                        ),
                      ),
                      185.heightBox,
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
                              child: Consumer(
                                builder:
                                    (context, ConfigProvider config, child) =>
                                        FutureBuilder(
                                  future: loadData(),
                                  builder: (context, snapshot) {
                                    return customButton(
                                        "Save",
                                        primaryColor,
                                        whiteColor,
                                        primaryColor.withOpacity(0.36), () {
                                      for (int i = 0;
                                          i < config.shipholds;
                                          i++) {
                                        if (config.shipholdsList[i]
                                                    .getMaxTemp ==
                                                -999 ||
                                            config.shipholdsList[i]
                                                    .getMinTemp ==
                                                -999) {
                                          config.isTempSetupValid = false;
                                        } else {
                                          config.isTempSetupValid = true;
                                        }
                                      }
                                      if (config.isTempSetupValid) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ConfigStep4Screen()));
                                      } else {
                                        VxToast.show(context,
                                            msg:
                                                "Temperature fields must be filled accurately! -999 is an error value");
                                      }
                                    });
                                  },
                                ),
                              ))
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
