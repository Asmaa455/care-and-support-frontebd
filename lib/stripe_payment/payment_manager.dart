import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:supcar/stripe_payment/stripe_keys.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clinteSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clinteSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "amna",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKeys}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'amount': amount,
        'currency': currency,
      },
    );
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return responseBody["client_secret"];
    } else {
      throw Exception('Failed to create payment intent');
    }
  }
}
