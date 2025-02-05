// import 'package:stripe_payment/stripe_payment.dart';
// import 'package:supcar/stripe_payment/stripe_keys.dart';

// class PaymentManager {
//   PaymentManager() {
//     // قم بإعداد Stripe عند إنشاء الكائن
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: ApiKeys.publishableKeys, // استبدلها بمفتاحك الحقيقي
//         merchantId: "Test", // معرف التاجر
//         androidPayMode: 'test', // وضع الاختبار
//       ),
//     );
//   }

//   void createToken() {
//     // اجمع معلومات البطاقة من المستخدم بطريقة آمنة
//     CreditCard testCard = CreditCard(
//       number: '4242424242424242', // رقم بطاقة اختبار
//       expMonth: 12,
//       expYear: 23,
//     );

//     // أنشئ الرمز
//     StripePayment.createTokenWithCard(testCard).then((token) {
//       print(token.tokenId); // هذا هو الرمز الذي سيتم إرساله إلى الباك إند
//       // يمكنك الآن إرسال token.tokenId إلى الخادم لمعالجة الدفع
//     }).catchError((error) {
//       print("خطأ في إنشاء الرمز: $error");
//     });
//   }
// }
