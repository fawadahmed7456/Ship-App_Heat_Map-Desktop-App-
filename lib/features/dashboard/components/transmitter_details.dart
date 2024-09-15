import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class TransmitterDetails extends StatelessWidget {
  final String transmitterID;
  final double batteryPercentage;
  final double signalStrength;
  final String tempMetric;
  const TransmitterDetails({
    super.key,
    required this.transmitterID,
    required this.batteryPercentage,
    required this.signalStrength,
    required this.tempMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 423,
        height: 231,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 70,
                color: blackColor.withOpacity(0.11))
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Transmitter "
                        .text
                        .size(24)
                        .semiBold
                        .textStyle(GoogleFonts.inter())
                        .make(),
                    transmitterID.text
                        .size(24)
                        .textStyle(GoogleFonts.inter())
                        .make(),
                    40.widthBox,
                    const Icon(Icons.signal_cellular_4_bar_rounded),
                    SizedBox(
                      width: 55,
                      child: " $signalStrength"
                          .text
                          .size(15)
                          .semiBold
                          .textStyle(GoogleFonts.inter())
                          .make(),
                    ),
                  ],
                ),
                58.heightBox,
                SizedBox(
                  width: 235,
                  height: 66,
                  child: Row(
                    children: [
                      const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.battery_full,
                          size: 66,
                        ),
                      ),
                      "$batteryPercentage%"
                          .text
                          .size(50)
                          .semiBold
                          .textStyle(GoogleFonts.inter())
                          .make(),
                    ],
                  ),
                )
              ],
            )));
  }
}
