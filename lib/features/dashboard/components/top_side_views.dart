import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../cores/icons/icons.dart';
import 'hold_view_box.dart';

class TopSideViews extends StatelessWidget {
  const TopSideViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1380,
      height: 754,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 70,
                color: Colors.black.withOpacity(0.11))
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 24, bottom: 24),
        child: Row(
          children: [
            Column(
              children: [
                180.heightBox,
                "Top view"
                    .text
                    .textStyle(GoogleFonts.inter())
                    .size(24)
                    .color(Colors.black)
                    .make(),
                270.heightBox,
                "Side view"
                    .text
                    .textStyle(GoogleFonts.inter())
                    .size(24)
                    .color(Colors.black)
                    .make(),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            80.heightBox,
                            SizedBox(
                                width: 1207,
                                height: 300,
                                child: Image.asset(
                                  icShipTop,
                                  scale: 0.3,
                                  color: mildGrayColor,
                                )),
                            10.heightBox,
                            SizedBox(
                                width: 1207,
                                height: 300,
                                child: Image.asset(
                                  icShipSide,
                                  scale: 0.3,
                                  color: mildGrayColor,
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: SizedBox(
                    width: 1170,
                    height: 800,
                    child: HoldViewBox(
                      borderColor: Colors.black.withOpacity(0.28),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
