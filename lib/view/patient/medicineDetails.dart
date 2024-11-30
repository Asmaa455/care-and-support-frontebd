import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/controller/MedicineDetailscontroller.dart';
import 'package:supcar/controller/medicinecontroller.dart';
import 'package:supcar/model/medicineModel.dart';
import 'package:timelines_plus/timelines_plus.dart';

class MedicineDetails extends StatelessWidget {
  MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Medicinemodel medicine = Get.arguments;
    final MedicineDetailsController controller =
        Get.put(MedicineDetailsController());
    // تحديث جدول الأوقات عند إنشاء الصفحة

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
    );
  }
}
