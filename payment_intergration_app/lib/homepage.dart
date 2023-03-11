import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await makepayment();
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(child: Text("Pay")),
              ),
            )
          ]),
    );
  }

  Future<void> makepayment() async {
    try {
      paymentIntentData = await createPaymentIntent('100', 'INR');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            style: ThemeMode.system,
            merchantDisplayName: 'Ashish Pandey',
          ))
          .then((value) {});

      displayPaymentSheet();
    } catch (e) {
      print('Exception' + e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          //  parameters: PresentPaymentSheetParameters(clientSecret: paymentIntentData>['paymentIntent']??'',
          //  confirmPayment: true)
          );
      setState(() {
        paymentIntentData = null;
      });
      displaySnackbar('Payment succesfully completed');
    } catch (e) {
      print(e.toString());
    }
  }

  void displaySnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'paymnt_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            //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
            'Authorization':
                'Bearer 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',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body.toString());
    } catch (e) {
      print('Exception' + e.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
}
