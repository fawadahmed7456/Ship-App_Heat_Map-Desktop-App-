import 'package:flutter/material.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/cores/icons/icons.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/tuple_model.dart';
import 'package:velocity_x/velocity_x.dart';

@override
Widget temperatureWarning(CustomQuadruple4 quaruple) {
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
      padding: const EdgeInsets.all(40),
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
            children: [
              "Increase in temperature!".text.size(24).make(),
              Row(
                children: [
                  "Click Hold 2".text.semiBold.size(20).make(),
                  " - for more details".text.size(20).make(),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
