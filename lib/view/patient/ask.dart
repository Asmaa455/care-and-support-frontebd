import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/askcontroller.dart';
import 'package:supcar/stripe_payment/payment_manager.dart';
import 'package:supcar/stripe_payment/test.dart';

class Ask extends StatelessWidget {
  final AskController controller = Get.put(AskController());
  String cardNumber = '4242 4242 4242 4242'; // Example (must be a valid number)
  String expiryDate = '12/25'; // MM/YY
  String cardHolderName = 'محمد أحمد';
  String cvvCode = '123';
  bool isCvvFocused = false;
  final GlobalKey<FormState> _formKey1 = GlobalKey();
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Doctor',
          style: TextStyle(color: lightPink),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 15,
                    decoration:
                        InputDecoration(hintText: 'Write Your Consultation'),
                    controller: controller.content,
                    validator: (val) {
                      return Valid().vaidInput(val!, 5, 1000);
                    },
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.5,
                          minChildSize: 0.25,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) {
                            return ListView(
                              controller: scrollController,
                              children: [
                                // CreditCardForm(
                                //   formKey: _formKey2,
                                //   cardNumber: cardNumber,
                                //   expiryDate: expiryDate,
                                //   cardHolderName: cardHolderName,
                                //   cvvCode: cvvCode,
                                //   cardNumberKey: controller.cardNumberKey,
                                //   cvvCodeKey: controller.cvvCodeKey,
                                //   expiryDateKey: controller.expiryDateKey,
                                //   cardHolderKey: controller.cardHolderKey,
                                //   onCreditCardModelChange:
                                //       (CreditCardModel data) {},
                                //   obscureCvv: false,
                                //   obscureNumber: false,
                                //   isHolderNameVisible: true,
                                //   isCardNumberVisible: true,
                                //   isExpiryDateVisible: true,
                                //   enableCvv: true,
                                //   cvvValidationMessage:
                                //       'Please input a valid CVV',
                                //   dateValidationMessage:
                                //       'Please input a valid date',
                                //   numberValidationMessage:
                                //       'Please input a valid number',
                                //   cardNumberValidator: (String? cardNumber) {},
                                //   expiryDateValidator: (String? expiryDate) {},
                                //   cvvValidator: (String? cvv) {},
                                //   cardHolderValidator:
                                //       (String? cardHolderName) {},
                                //   onFormComplete: () {
                                //     // callback to execute at the end of filling card data
                                //   },
                                //   autovalidateMode: AutovalidateMode.always,
                                //   disableCardNumberAutoFillHints: false,
                                //   inputConfiguration: const InputConfiguration(
                                //     cardNumberDecoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       labelText: 'Number',
                                //       hintText: 'XXXX XXXX XXXX XXXX',
                                //     ),
                                //     expiryDateDecoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       labelText: 'Expired Date',
                                //       hintText: 'XX/XX',
                                //     ),
                                //     cvvCodeDecoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       labelText: 'CVV',
                                //       hintText: 'XXX',
                                //     ),
                                //     cardHolderDecoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       labelText: 'Card Holder',
                                //     ),
                                //     cardNumberTextStyle: TextStyle(
                                //       fontSize: 10,
                                //       color: Colors.black,
                                //     ),
                                //     cardHolderTextStyle: TextStyle(
                                //       fontSize: 10,
                                //       color: Colors.black,
                                //     ),
                                //     expiryDateTextStyle: TextStyle(
                                //       fontSize: 10,
                                //       color: Colors.black,
                                //     ),
                                //     cvvCodeTextStyle: TextStyle(
                                //       fontSize: 10,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.credit_card_sharp),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey1.currentState?.validate() ?? false) {
                        controller.addConsultation();
                      } else {
                        print('Form validation failed');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(pink),
                    ),
                    child: Text('Send Consultation'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
