import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../cores/colors/colors.dart';
import '../../../cores/components/custom_textfields.dart';

String convertToThreePlaces(int number) {
  String numberString = number.toString();
  int length = numberString.length;

  if (length < 3) {
    int leadingZeros = 3 - length;
    numberString = '0' * leadingZeros + numberString;
  }

  return numberString;
}

class ShipholdIDs extends StatelessWidget {
  const ShipholdIDs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ConfigProvider config, child) => FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          return Column(
            children: List.generate(
                config.shipholds,
                (holdIndex) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Hold ${holdIndex + 1}"
                            .text
                            .size(16)
                            .textStyle(GoogleFonts.inter())
                            .semiBold
                            .make(),
                        10.heightBox,
                        "H${holdIndex + 1} Recievers"
                            .text
                            .size(13)
                            .textStyle(GoogleFonts.inter())
                            .color(Colors.blueGrey)
                            .semiBold
                            .make(),
                        14.heightBox,
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 96),
                            itemBuilder: ((context, recIndex) {
                              config.shipholdsList[holdIndex]
                                  .recieversList[recIndex]
                                  .setReceiverID(
                                      "H${holdIndex + 1}Rx${convertToThreePlaces(recIndex + 1)}");
                              if (config.shipholdsList[holdIndex]
                                      .recieversList[recIndex].recieverName ==
                                  "unknown") {
                                config.shipholdsList[holdIndex]
                                        .recieversList[recIndex].recieverName =
                                    "H${holdIndex + 1}Rx${convertToThreePlaces(recIndex + 1)}";
                              }

                              return Column(
                                children: [
                                  SizedBox(
                                    width: 318,
                                    height: 66,
                                    child: customTextField(
                                        data != null &&
                                                data
                                                        .shipholdsList[
                                                            holdIndex]
                                                        .recieversList[recIndex]
                                                        .recieverName !=
                                                    "unknown"
                                            ? data
                                                .shipholdsList[holdIndex]
                                                .recieversList[recIndex]
                                                .recieverName
                                            : "H${holdIndex + 1}Rx${convertToThreePlaces(recIndex + 1)}",
                                        grayColor,
                                        false,
                                        null,
                                        null,
                                        null, (String value) {
                                      if (value.isNotEmpty) {
                                        if (config.validateHoldIds(value)) {
                                          config.setRecIdError(recIndex, "");
                                          config.shipholdsList[holdIndex]
                                              .recieversList[recIndex]
                                              .setReceiverName(value);
                                        } else {
                                          config.setRecIdError(recIndex,
                                              "Reciever Name must be alphanumeric");
                                        }
                                      } else {
                                        config.shipholdsList[holdIndex]
                                            .recieversList[recIndex]
                                            .setReceiverName(
                                                "H${holdIndex + 1}Rx${convertToThreePlaces(recIndex + 1)}");
                                      }
                                    }, false, null),
                                  ),
                                  5.heightBox,
                                  config.recIdErrorList[recIndex].text
                                      .size(10)
                                      .color(primaryColor)
                                      .make()
                                ],
                              );
                            })),
                        "H${holdIndex + 1} Transmitters"
                            .text
                            .size(13)
                            .textStyle(GoogleFonts.inter())
                            .color(Colors.blueGrey)
                            .semiBold
                            .make(),
                        14.heightBox,
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 14,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 0,
                                    mainAxisExtent: 85),
                            itemBuilder: ((context, transIndex) {
                              config.shipholdsList[holdIndex]
                                  .transmitterList[transIndex]
                                  .setTransmitterID(
                                      "H${holdIndex + 1}Tx${convertToThreePlaces(transIndex + 1)}");
                              if (config
                                      .shipholdsList[holdIndex]
                                      .transmitterList[transIndex]
                                      .transmitterName ==
                                  "unknown") {
                                config
                                        .shipholdsList[holdIndex]
                                        .transmitterList[transIndex]
                                        .transmitterName =
                                    "H${holdIndex + 1}Tx${convertToThreePlaces(transIndex + 1)}";
                              }

                              return Column(
                                children: [
                                  SizedBox(
                                    width: 318,
                                    height: 66,
                                    child: customTextField(
                                        data != null &&
                                                (data
                                                        .shipholdsList[
                                                            holdIndex]
                                                        .transmitterList[
                                                            transIndex]
                                                        .transmitterName !=
                                                    "unknown")
                                            ? data
                                                .shipholdsList[holdIndex]
                                                .transmitterList[transIndex]
                                                .transmitterName
                                            : "H${holdIndex + 1}Tx${convertToThreePlaces(transIndex + 1)}",
                                        grayColor,
                                        false,
                                        null,
                                        null,
                                        null, (String value) {
                                      if (value.isNotEmpty) {
                                        if (config.validateHoldIds(value)) {
                                          config.setTransIdError(
                                              transIndex, "");
                                          config.shipholdsList[holdIndex]
                                              .transmitterList[transIndex]
                                              .setTransmitterName(value);
                                        } else {
                                          config.setTransIdError(transIndex,
                                              "Transmitter Id must be alphanumeric");
                                        }
                                      } else {
                                        config.shipholdsList[holdIndex]
                                            .transmitterList[transIndex]
                                            .setTransmitterName(
                                                "H${holdIndex + 1}Tx${convertToThreePlaces(transIndex + 1)}");
                                      }
                                    }, false, null),
                                  ),
                                  2.heightBox,
                                  config.transIdErrorList[transIndex].text
                                      .size(10)
                                      .color(primaryColor)
                                      .make(),
                                ],
                              );
                            })),
                        20.heightBox,
                      ],
                    )),
          );
        },
      ),
    );
  }
}
