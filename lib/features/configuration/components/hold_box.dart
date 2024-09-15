import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HoldBox extends StatefulWidget {
  final Color? borderColor;
  const HoldBox({super.key, this.borderColor});

  @override
  State<HoldBox> createState() => _HoldBoxState();
}

class _HoldBoxState extends State<HoldBox> {
  bool isDataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ConfigProvider config, child) {
      return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            if (isDataLoaded == false) {
              config.shipholdsList = data.shipholdsList;
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                children: List.generate(
              config.shipholds,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: widget.borderColor ?? textGrayColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: GestureDetector(
                      onTap: () {
                        for (int i = 0; i < 10; i++) {
                          config.setActiveHold(i, false);
                        }
                        config.setActiveHold(index, true);

                        config.notifier();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: config.istappedList[index]
                              ? primaryColor.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            22.heightBox,
                            "Hold ${index + 1}"
                                .text
                                .size(13)
                                .color(textGrayColor)
                                .semiBold
                                .make(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
          );
        },
      );
    });
  }
}
