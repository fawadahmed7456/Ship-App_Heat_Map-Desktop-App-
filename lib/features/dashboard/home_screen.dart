import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/rear_view.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/temperature_graph.dart';
import 'package:ship_heat_managment_app/features/dashboard/help_and_instructions.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/tuple_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/colors/colors.dart';
import '../../cores/components/custom_button.dart';
import 'components/temperature_detials.dart';
import 'components/temperature_warnings.dart';
import 'components/top_side_views.dart';
import 'components/transmitter_warning.dart';
import 'management_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder:
          (context, DashboardProvider dash, ConfigProvider config, child) =>
              FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            config.shipholdsList = data.shipholdsList;
          }
          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 68, right: 68, top: 68, bottom: 40),
                  child: Column(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              "Overview"
                                  .text
                                  .bold
                                  .size(32)
                                  .textStyle(GoogleFonts.inter())
                                  .color(Colors.black)
                                  .make(),
                              450.widthBox,
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
                                    'item1', -999, -999, -999))),
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
                          child: Row(children: [TopSideViews()])),
                      34.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(
                                width: 901, height: 698, child: RearView()),
                            24.widthBox,
                            const TemperatureGraph(),
                          ],
                        ),
                      ),
                      87.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 323,
                                height: 56,
                                child: customButton(
                                    "Back to Dashboard",
                                    Colors.black,
                                    Colors.white,
                                    whiteColor,
                                    () {}),
                              ),
                            ),
                          ],
                        ),
                      ),
                      68.heightBox,
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
