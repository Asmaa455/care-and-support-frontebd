import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/Addbloodprecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Addbloodpre extends StatelessWidget {
  Addbloodpre({super.key});
  final Addbloodprecontroller controller = Get.put(Addbloodprecontroller());

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 16,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 50),
      ),
      child: Scaffold(
        appBar: AppBar(
            title: Icon(
              MyFlutterApp.nounBloodPressure,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Icon(
            //   MyFlutterApp.nounBloodPressure,
            //   color: Colors.red,
            //   weight: 20,
            //   size: 100,
            // ),
            Obx(() => Text(
                  '94'.tr +
                      ': ${controller.currentValue.value.round()}/${controller.currentValue2.value.round()} mmHg',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Obx(() => SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      radiusFactor: 1, // تصغير حجم المحور
                      minimum: 70,
                      maximum: 140,
                      startAngle: 130,
                      endAngle: 45,
                      showLabels: true,
                      labelsPosition: ElementsPosition.inside,
                      showTicks: true,
                      interval: 5,
                      showFirstLabel: false,
                      axisLineStyle: const AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve),
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 70,
                          endValue: 90,
                          color: Colors.amber,
                        ),
                        GaugeRange(
                          startValue: 90,
                          endValue: 120,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startValue: 120,
                          endValue: 129,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          startValue: 129,
                          endValue: 139,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startValue: 139,
                          endValue: 150,
                          color: Colors.red,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: controller.currentValue.value,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 12,
                          sizeUnit: GaugeSizeUnit.logicalPixel,
                          color: Colors.white54,
                        ),
                        MarkerPointer(
                          value: controller.currentValue.value,
                          enableDragging: true,
                          onValueChanged: (value) {
                            controller.currentValue(value);
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
                            '96'.tr,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          angle: 90,
                          positionFactor: 0.8,
                        ),
                      ],
                    ),
                    RadialAxis(
                      radiusFactor: 0.6, // تصغير حجم المحور
                      minimum: 40,
                      maximum: 100,
                      startAngle: 130,
                      endAngle: 45,
                      showLabels: true,
                      labelsPosition: ElementsPosition.inside,
                      showTicks: true,
                      interval: 5,
                      showFirstLabel: false,
                      axisLineStyle: const AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve),
                      ranges: [
                        GaugeRange(
                          startValue: 40,
                          endValue: 60,
                          color: Colors.amber,
                        ),
                        GaugeRange(
                          startValue: 60,
                          endValue: 80,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startValue: 80,
                          endValue: 89,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          startValue: 89,
                          endValue: 100,
                          color: Colors.orange,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: controller.currentValue2.value,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 12,
                          sizeUnit: GaugeSizeUnit.logicalPixel,
                          color: Colors.white54,
                        ),
                        MarkerPointer(
                          value: controller.currentValue2.value,
                          enableDragging: true,
                          onValueChanged: (value) {
                            controller.currentValue2(value);
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
                            '95'.tr,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          angle: 90,
                          axisValue: 5,
                          positionFactor: 0.7,
                        ),
                      ],
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  height: 20,
                  width: 20,
                ),
                Text('Normal'),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  height: 20,
                  width: 20,
                ),
                Text('High'),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.orange,
                  height: 20,
                  width: 20,
                ),
                Text('Very high'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
