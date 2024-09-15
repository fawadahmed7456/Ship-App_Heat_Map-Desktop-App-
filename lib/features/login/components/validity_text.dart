import 'package:flutter/material.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget validityText(String data) {
  return Row(children: [10.heightBox, data.text.color(primaryColor).make()]);
}
