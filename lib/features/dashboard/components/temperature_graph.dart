import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../cores/icons/icons.dart';

class TemperatureGraph extends StatelessWidget {
  const TemperatureGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 457,
      height: 698,
      padding: const EdgeInsets.all(30),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          "Temperature Gradient".text.black.size(14).make(),
          200.heightBox,
          Image.asset(icTempGraph)
        ],
      ),
    );
  }
}
