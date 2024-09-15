import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/hold_view_box_2.dart';
import 'package:velocity_x/velocity_x.dart';

class SideView extends StatelessWidget {
  const SideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1380,
        height: 654,
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
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(children: [
            "Side View".text.size(24).textStyle(GoogleFonts.inter()).make(),
            34.heightBox,
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  430.heightBox,
                  Image.asset(
                    icShipSide,
                    scale: 0.275,
                    color: mildGrayColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 1340,
                      height: 472,
                      child: HoldViewBox2(
                        borderColor: blackColor.withOpacity(0.28),
                      )),
                ],
              ),
            ]),
          ]),
        ));
  }
}
