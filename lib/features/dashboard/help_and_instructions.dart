import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/dashboard/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/colors/colors.dart';
import 'management_screen.dart';

class HelpAndInstructions extends StatelessWidget {
  const HelpAndInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.all(66),
            child: Column(
              children: [
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "Help & Instructions"
                            .text
                            .bold
                            .size(32)
                            .textStyle(GoogleFonts.inter())
                            .color(Colors.black)
                            .make(),
                        325.widthBox,
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
                                    .color(primaryColor)
                                    .textStyle(GoogleFonts.inter())
                                    .make()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                71.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 1379,
                    height: 167,
                    decoration: BoxDecoration(
                        color: grayColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Instruction will be soon uploaded here"
                                .text
                                .size(20)
                                .textStyle(GoogleFonts.inter())
                                .color(textGrayColor)
                                .make()
                          ],
                        )),
                  ),
                ),
                50.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 336,
                            height: 552,
                            child: Image.asset(
                              icHelpAndInstructions,
                              filterQuality: FilterQuality.high,
                            ),
                          )
                        ],
                      ),
                      56.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Each hull has a grid of sensors placed along the access "
                              .text
                              .size(20)
                              .textStyle(GoogleFonts.inter())
                              .make(),
                          "corridor and levels."
                              .text
                              .size(20)
                              .textStyle(GoogleFonts.inter())
                              .make(),
                          10.heightBox,
                          "\u2022 Number of devices and size of gride is customizable"
                              .text
                              .size(20)
                              .textStyle(GoogleFonts.inter())
                              .make(),
                          40.heightBox,
                          Row(
                            children: [
                              Column(
                                children: [
                                  40.heightBox,
                                  RotatedBox(
                                    quarterTurns: -1,
                                    child: "Vertical  Distributed Sensors"
                                        .text
                                        .size(16)
                                        .color(textGrayColor)
                                        .textStyle(GoogleFonts.inter())
                                        .make(),
                                  ),
                                ],
                              ),
                              37.widthBox,
                              Column(
                                children: [
                                  "Corridor Distribited Sensors"
                                      .text
                                      .size(16)
                                      .color(textGrayColor)
                                      .textStyle(GoogleFonts.inter())
                                      .make(),
                                  15.heightBox,
                                  Image.asset(icGridExample)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
