import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class RecieverDetails extends StatelessWidget {
  final String recieverId;
  final double recTemperature;
  final double batterPercentage;
  final double signalStrength;
  final String tempMetric;
  const RecieverDetails(
      {super.key,
      required this.recieverId,
      required this.recTemperature,
      required this.batterPercentage,
      required this.signalStrength,
      required this.tempMetric});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 610,
      height: 316,
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
          padding:
              const EdgeInsets.only(left: 56, right: 56, top: 35, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              recieverId.text.size(36).textStyle(GoogleFonts.inter()).make(),
              29.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Temperature"
                      .text
                      .size(24)
                      .textStyle(GoogleFonts.inter())
                      .make(),
                  SizedBox(
                    width: 155,
                    child: Row(children: [
                      const Icon(
                        Icons.thermostat,
                        size: 29,
                      ),
                      " $recTemperature°${tempMetric[0]}"
                          .text
                          .size(24)
                          .textStyle(GoogleFonts.inter())
                          .make(),
                    ]),
                  )
                ],
              ),
              29.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Signal Strength"
                      .text
                      .size(24)
                      .textStyle(GoogleFonts.inter())
                      .make(),
                  SizedBox(
                    width: 150,
                    child: Row(children: [
                      const Icon(
                        Icons.signal_cellular_4_bar_rounded,
                        size: 29,
                      ),
                      " $signalStrength"
                          .text
                          .size(24)
                          .textStyle(GoogleFonts.inter())
                          .make(),
                    ]),
                  )
                ],
              ),
              29.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Battery Status"
                      .text
                      .size(24)
                      .textStyle(GoogleFonts.inter())
                      .make(),
                  SizedBox(
                    width: 150,
                    child: Row(children: [
                      const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.battery_full,
                          size: 29,
                        ),
                      ),
                      " $batterPercentage"
                          .text
                          .size(24)
                          .textStyle(GoogleFonts.inter())
                          .make(),
                    ]),
                  )
                ],
              )
            ],
          )),
    );
  }
}
