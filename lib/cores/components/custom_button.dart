import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customButton(
  String title,
  Color bgColor,
  Color fgColor,
  Color shadowColor,
  onpress,
) {
  return SizedBox(
    width: 484,
    height: 66,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4), color: shadowColor, blurRadius: 40)
      ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onpress,
          child: title.text.size(20).semiBold.color(fgColor).makeCentered()),
    ),
  );
}
