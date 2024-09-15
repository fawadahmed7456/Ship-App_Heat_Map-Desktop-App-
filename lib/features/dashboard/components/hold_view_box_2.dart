import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/dashboard/components/selection_widgets/selection_widgets.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HoldViewBox2 extends StatefulWidget {
  final Color? borderColor;
  const HoldViewBox2({super.key, this.borderColor});

  @override
  State<HoldViewBox2> createState() => _HoldViewBox2State();
}

class _HoldViewBox2State extends State<HoldViewBox2> {
  bool dataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder:
          (context, ConfigProvider config, DashboardProvider dash, child) =>
              FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            if (dataLoaded == false) {
              config = data;
              dataLoaded = true;
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                children: List.generate(
              config.getShipholds!,
              (holdIndex) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    for (int i = 0; i < 10; i++) {
                      dash.setActiveHold(i, false);
                    }
                    dash.setActiveHold(holdIndex, true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: widget.borderColor ?? textGrayColor),
                        color: dash.istappedList[holdIndex]
                            ? primaryColor.withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        22.heightBox,
                        "Hold ${holdIndex + 1}"
                            .text
                            .size(13)
                            .color(textGrayColor)
                            .semiBold
                            .make(),
                        105.heightBox,
                        Column(
                            children: List.generate(
                                14,
                                (index) => Container(
                                    height: 18.5,
                                    decoration: BoxDecoration(
                                      color: topSideColor1(
                                              index, holdIndex, config)
                                          .withOpacity(0.7),
                                      border: Border.all(
                                          width: 0.5,
                                          color: widget.borderColor ??
                                              textGrayColor),
                                    ),
                                    child: topSideChild1(
                                        index, holdIndex, config)))),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
