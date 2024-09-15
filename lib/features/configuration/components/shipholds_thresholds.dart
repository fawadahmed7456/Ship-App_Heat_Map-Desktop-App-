import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../cores/colors/colors.dart';
import '../../../cores/components/custom_textfields.dart';
import '../provider/reciever_model.dart';
import '../provider/shipholds_model.dart';
import '../provider/transmitter_model.dart';

class ShipholdThresholds extends StatefulWidget {
  const ShipholdThresholds({super.key});

  @override
  State<ShipholdThresholds> createState() => _ShipholdThresholdsState();
}

class _ShipholdThresholdsState extends State<ShipholdThresholds> {
  bool isDataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Consumer4(
      builder: (context, ConfigProvider config, ShipholdsModel holdModel,
              TransmitterModel trans, RecieverModel rec, _) =>
          FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Min(larger than)                                             Max(including)"
                  .text
                  .size(16)
                  .textStyle(GoogleFonts.inter())
                  .semiBold
                  .make(),
              14.heightBox,
              Column(
                children: List.generate(config.shipholds, (holdIndex) {
                  if (data != null) {
                    if (isDataLoaded == false) {
                      for (int holds = 0; holds < config.shipholds; holds++) {
                        config.shipholdsList[holds].maxTemp =
                            data.shipholdsList[holds].maxTemp;
                        config.shipholdsList[holds].minTemp =
                            data.shipholdsList[holds].minTemp;
                      }
                      isDataLoaded = true;
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 6,
                                height: 60,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: (config.shipholdsList[holdIndex]
                                                      .getMinTemp >
                                                  0 &&
                                              config.shipholdsList[holdIndex]
                                                      .getMaxTemp <=
                                                  0.3)
                                          ? greenColortemp
                                          : (config.shipholdsList[holdIndex]
                                                          .getMinTemp >
                                                      0.3 &&
                                                  config
                                                          .shipholdsList[
                                                              holdIndex]
                                                          .getMaxTemp <=
                                                      1)
                                              ? yellowColortemp
                                              : redColortemp,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              15.heightBox,
                            ],
                          ),
                          7.widthBox,
                          Column(
                            children: [
                              SizedBox(
                                width: 318,
                                height: 66,
                                child: customTextField(
                                    data != null
                                        ? "${data.shipholdsList[holdIndex].minTemp}"
                                        : "Min",
                                    grayColor,
                                    false,
                                    null,
                                    null,
                                    null, (String value) {
                                  if (value.isNotEmpty) {
                                    if (config.validateTemperature(value)) {
                                      config.shipholdsList[holdIndex]
                                          .setMinTemp(
                                              double.tryParse(value) ?? 0);
                                      if (config.shipholdsList[holdIndex]
                                              .getMinTemp >=
                                          config.shipholdsList[holdIndex]
                                              .getMaxTemp) {
                                        config.setMinTempError(holdIndex,
                                            "Min temperature must be lesser than max temperature");
                                      } else {
                                        config.setMinTempError(holdIndex, "");
                                        config.setMaxTempError(holdIndex, "");
                                      }
                                    } else {
                                      config.setMinTempError(holdIndex,
                                          "Min temperature value between -20 and 200");
                                      config.notifier();
                                    }
                                  } else {}

                                  config.notifier();
                                }, false, null),
                              ),
                              2.heightBox,
                              config.minTempErrorList[holdIndex].text
                                  .size(10)
                                  .color(primaryColor)
                                  .make()
                            ],
                          ),
                          20.widthBox,
                          Column(
                            children: [
                              SizedBox(
                                width: 318,
                                height: 66,
                                child: customTextField(
                                    data != null
                                        ? "${data.shipholdsList[holdIndex].maxTemp}"
                                        : "Max",
                                    grayColor,
                                    false,
                                    null,
                                    null,
                                    null, (String value) {
                                  if (value.isNotEmpty) {
                                    if (config.validateTemperature(value)) {
                                      config.shipholdsList[holdIndex]
                                          .setMaxTemp(
                                              double.tryParse(value) ?? 0);
                                      if (config.shipholdsList[holdIndex]
                                              .getMaxTemp <=
                                          config.shipholdsList[holdIndex]
                                              .getMinTemp) {
                                        config.setMaxTempError(holdIndex,
                                            "Max temperature must be larger than min temperature");
                                      } else {
                                        config.setMaxTempError(holdIndex, "");
                                        config.setMinTempError(holdIndex, "");
                                      }
                                    } else {
                                      config.setMaxTempError(holdIndex,
                                          "Min temperature must be between -20 and 200");
                                    }
                                  } else {}
                                  config.notifier();
                                }, false, null),
                              ),
                              2.heightBox,
                              config.maxTempErrorList[holdIndex].text
                                  .size(10)
                                  .color(primaryColor)
                                  .make()
                            ],
                          ),
                        ],
                      ),
                      20.heightBox,
                    ],
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
