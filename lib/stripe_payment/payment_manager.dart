import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:supcar/constent/link.dart';

abstract class PaymentManager {
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

  static Future<void> makePayment(int amount, String currency) async {
    try {
      // Always handle currency conversion and validation first
      final validatedAmount = (amount * 100).toInt();
      final validatedCurrency = currency.toLowerCase();

      // Get client secret from your backend server
      final clientSecret =
          await _getClientSecret(validatedAmount, validatedCurrency);

      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception('Payment failed: ${error.toString()}');
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Your Merchant Name",
        // Add additional safety settings
        // style: ThemeMode.light,
        customerId: "current_customer_id", // If using customers
      ),
    );
  }

  // This should be moved to a backend server! This is just for demonstration.
  static Future<String> _getClientSecret(int amount, String currency) async {
    // This endpoint should be YOUR SERVER ENDPOINT, not direct Stripe API
    const backendUrl = '$serverLink/create-payment-intent';

    final response = await http.post(
      Uri.parse(backendUrl),
      headers: {
        'Content-Type': 'application/json',
        // Add any authentication headers needed for your backend
      },
      body: json.encode({
        'amount': amount,
        'currency': currency,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody["client_secret"];
    } else {
      final errorData = json.decode(response.body);
      throw Exception('Payment failed: ${errorData['error']['message']}');
    }
  }
}
