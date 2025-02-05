// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class AskController extends GetxController with Crud {
  var isLoading = false.obs;

  GlobalKey<FormFieldState<String>> cardNumberKey = GlobalKey();
  GlobalKey<FormFieldState<String>> cvvCodeKey = GlobalKey();
  GlobalKey<FormFieldState<String>> expiryDateKey = GlobalKey();
  GlobalKey<FormFieldState<String>> cardHolderKey = GlobalKey();

  TextEditingController content = TextEditingController();
  int id = 1;
  int patientId = 1;
  @override
  void onInit() {
    super.onInit();
    addConsultation();
  }

  static Future<String> processPayment({
    required String cardNumber,
    required int expMonth,
    required int expYear,
    required String cvc,
  }) async {
    try {
      // 1. إنشاء PaymentMethod
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              // يمكن إضافة تفاصيل إضافية
              email: 'user@example.com',
            ),
          ),
        ),
      );

      // 2. إرجاع معرّف PaymentMethod
      return paymentMethod.id;
    } catch (e) {
      throw Exception('فشل في معالجة الدفع: ${e.toString()}');
    }
  }

  void addConsultation() async {
    isLoading.value = true;
    try {
      // 1. معالجة الدفع
      final paymentMethodId = await processPayment(
        cardNumber: cardNumberKey.toString(),
        expMonth: int.parse(expiryDateKey.toString().split('/')[0]),
        expYear: int.parse(expiryDateKey.toString().split('/')[1]),
        cvc: cvvCodeKey.toString(),
      );
      print(paymentMethodId);

      String url = '$serverLink$createConsultationLink';

      var response = await ApiService().postRequest1(url, {
        "consultation_text": content.text.toString(),
        'stripeToken': paymentMethodId,
      });
      isLoading.value = false;

      if (response != null && response['success'] == 'successfully') {
        Get.offNamed('doctorask');
      } else {
        print('Error: ${response['message']}');
      }
    } catch (e) {
      Get.snackbar('خطأ', '${e.toString()}');
    }
  }
}
