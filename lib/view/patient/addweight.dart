import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/Addweightcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Addweight extends StatelessWidget {
  Addweight({super.key});
  final Addweightcontroller controller = Get.put(Addweightcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Icon(
              MyFlutterApp.nounWeight,
              color: lightPink,
              weight: 2,
              size: 50,
            ),
            backgroundColor: deepPurple,
            centerTitle: true,
            actions: [
              Container(
                decoration: BoxDecoration(
                    color: lightPink,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    highlightColor: lightPink,
                    color: deepPurple,
                    onPressed: controller.addValue,
                    icon: Icon(
                      Icons.check_outlined,
                      weight: 3,
                    )),
              ),
            ]),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(
            () => Text(
              '${'140'.tr} ${controller.sliderValue.value.round()} Kg',
              style: TextStyle(
                  color: deepPurple, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  radiusFactor: 0.8, // تصغير حجم المحور
                  minimum: 0,
                  maximum: 140,
                  startAngle: 130,
                  endAngle: 45,
                  showLabels: true,
                  labelsPosition: ElementsPosition.inside,
                  showTicks: true,
                  interval: 10,
                  showFirstLabel: false,
                  axisLineStyle:
                      const AxisLineStyle(cornerStyle: CornerStyle.bothCurve),

                  pointers: <GaugePointer>[
                    RangePointer(
                      value: controller.sliderValue.value,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 12,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      color: Colors.yellow[100],
                    ),
                    MarkerPointer(
                      value: controller.sliderValue.value,
                      enableDragging: true,
                      onValueChanged: (value) {
                        controller.sliderValue(value);
                      },
                      markerHeight: 20,
                      markerWidth: 20,
                      markerType: MarkerType.circle,
                      borderWidth: 2,
                      color: deepPurple,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        '${controller.sliderValue.value.round()} Kg',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      angle: 0,
                      positionFactor: 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: lightYellow,
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(25)),
            child: TextButton(
                onPressed: () {
                  controller.addValue;
                },
                child: Text(
                  '85'.tr,
                  style:
                      TextStyle(color: deepPurple, fontWeight: FontWeight.bold),
                )),
          ),
        ]));
  }
}
