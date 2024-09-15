import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/configuration/components/config_stepper.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step2_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';
import '../../cores/components/custom_textfields.dart';

Future<ConfigProvider?> loadData() async {
  Box<ConfigProvider> configBox = await Hive.openBox<ConfigProvider>("config2");
  return configBox.get("final_config");
}

double convertToTwoDecimalPlaces(double value) {
  String stringValue = value.toStringAsFixed(2);
  return double.parse(stringValue);
}

class ConfigStep1Screen extends StatefulWidget {
  const ConfigStep1Screen({Key? key}) : super(key: key);

  @override
  State<ConfigStep1Screen> createState() => _ConfigStep1ScreenState();
}

class _ConfigStep1ScreenState extends State<ConfigStep1Screen> {
  bool isDataLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 66, right: 66, top: 80, bottom: 72),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Consumer(
            builder: (context, ConfigProvider config, _) => Column(
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
                        children: [configStepper(1)],
                      )
                    ],
                  ),
                ),
                51.heightBox,
                Center(
                  child: FutureBuilder(
                    future: loadData(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      if (isDataLoaded == false) {
                        if (data != null) {
                          config.shipholds = data.shipholds;
                          isDataLoaded = true;
                        }
                      }

                      return Column(
                        children: [
                          "1. How many holds in the ship?"
                              .text
                              .size(36)
                              .bold
                              .make(),
                          39.heightBox,
                          SizedBox(
                              width: 484,
                              height: 66,
                              child: customTextField(
                                  data == null
                                      ? "Ship holds ( 01 to 10 )"
                                      : "${data.shipholds}",
                                  grayColor,
                                  false,
                                  null,
                                  null,
                                  null, (String value) {
                                if (config.validateShipholds(
                                    int.tryParse(value) ?? 0)) {
                                  config.setShipholds(
                                      int.tryParse(value) ?? config.shipholds);
                                  config.setShipholdError("");
                                } else {
                                  config.setShipholdError(
                                      "Ship holds can be between 01 and 10");
                                }
                              }, false, null)),
                          5.heightBox,
                          config.shipholdError.text.color(Colors.red).make(),
                          140.heightBox,
                          Container(
                            width: 1380,
                            height: 235,
                            decoration: const BoxDecoration(color: whiteColor),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 1380,
                                  height: 235,
                                  child: Image.asset(
                                    icShipView,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 1250,
                                    height: 235,
                                    child: Row(
                                      children: List.generate(
                                          config.shipholds,
                                          (index) => Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.white)),
                                                  child: Column(
                                                    children: [
                                                      160.heightBox,
                                                      "Hold ${index + 1}"
                                                          .text
                                                          .semiBold
                                                          .white
                                                          .make(),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          118.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
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
                                      if (config.shipholdError == "") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ConfigStep2Screen()));
                                      } else {
                                        VxToast.show(context,
                                            msg:
                                                "Check for errors and enter relevant shipholds!");
                                      }
                                    }))
                              ],
                            ),
                          )
                        ],
                      );
                    },
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
