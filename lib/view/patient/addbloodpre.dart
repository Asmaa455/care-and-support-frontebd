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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 20,
                ),
                Obx(() => Text(
                      'القيمة الحالية: ${controller.currentValue.value.round()}/${controller.currentValue2.value.round()} mmHg',
                      style: TextStyle(fontSize: 20),
                    )),
                Obx(() => SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          radiusFactor: 0.8, // تصغير حجم المحور
                          minimum: 90,
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
                                'systolic',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              angle: 90,
                              positionFactor: 0.8,
                            ),
                          ],
                        ),
                        RadialAxis(
                          radiusFactor: 0.5, // تصغير حجم المحور
                          minimum: 70,
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
                              startValue: 70,
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
                                'diastolic',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
