import 'package:flutter/material.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:velocity_x/velocity_x.dart';

class TransmitterWarning extends StatelessWidget {
  const TransmitterWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 70,
                color: blackColor.withOpacity(0.11))
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50, height: 50, child: Image.asset(icWarning))
              ],
            ),
            28.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Transmitter".text.size(24).make(),
                "H1Tx002".text.semiBold.size(20).make(),
                "Battery Low".text.size(20).make(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
