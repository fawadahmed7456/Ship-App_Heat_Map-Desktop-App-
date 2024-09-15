import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../cores/colors/colors.dart';

Widget configStepper(int activestep) {
  return Row(
    children: [
      //step1
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 1 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  1"
                  .text
                  .size(15)
                  .color(
                    activestep >= 1 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
      SizedBox(
          width: 40,
          height: 3,
          child: Container(
            color: activestep >= 1 ? primaryColor : grayColor,
          )),

      //step2
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 2 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  2"
                  .text
                  .size(15)
                  .color(
                    activestep >= 2 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
      SizedBox(
          width: 40,
          height: 3,
          child: Container(
            color: activestep >= 2 ? primaryColor : grayColor,
          )),

      //step3
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 3 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  3"
                  .text
                  .size(15)
                  .color(
                    activestep >= 3 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
      SizedBox(
          width: 40,
          height: 3,
          child: Container(
            color: activestep >= 3 ? primaryColor : grayColor,
          )),

      //step4
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 4 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  4"
                  .text
                  .size(15)
                  .color(
                    activestep >= 4 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
      SizedBox(
          width: 40,
          height: 3,
          child: Container(
            color: activestep >= 4 ? primaryColor : grayColor,
          )),
      //step 5
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 5 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  5"
                  .text
                  .size(15)
                  .color(
                    activestep >= 5 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
      SizedBox(
          width: 40,
          height: 3,
          child: Container(
            color: activestep >= 5 ? primaryColor : grayColor,
          )),

      //step6
      Stack(
        children: [
          Icon(
            Icons.circle,
            color: activestep >= 6 ? primaryColor : grayColor,
          ),
          Container(
              color: Colors.transparent,
              child: "  6"
                  .text
                  .size(15)
                  .color(
                    activestep >= 6 ? whiteColor : Colors.black,
                  )
                  .make()),
        ],
      ),
    ],
  );
}
