import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/selection_widgets/selection_widgets.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../cores/colors/colors.dart';
import '../../../cores/icons/icons.dart';

class RearView extends StatelessWidget {
  const RearView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder:
          (context, ConfigProvider config, DashboardProvider dash, child) =>
              Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 70,
                  color: Colors.black.withOpacity(0.11))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Rear View - Hold ${dash.activeHold + 1}"
                    .text
                    .size(24)
                    .textStyle(GoogleFonts.inter())
                    .color(Colors.black)
                    .make(),
              ],
            ),
            10.heightBox,
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      icShipRearView,
                      color: mildGrayColor,
                      scale: 0.9,
                    )
                  ],
                ),
                Column(
                  children: [
                    180.heightBox,
                    SizedBox(
                        width: 590,
                        height: 425,
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 98,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 14,
                                    mainAxisExtent: 62,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0),
                            itemBuilder: ((context, index) {
                              int currentRow = index ~/ 14;
                              int currentColumn = index % 14;
                              return GestureDetector(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: rearColor1(currentRow,
                                          currentColumn, config, dash),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.28),
                                          width: 0.5),
                                    ),
                                    child: rearChild1(currentRow, currentColumn,
                                        config, dash)),
                              );
                            }))),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
