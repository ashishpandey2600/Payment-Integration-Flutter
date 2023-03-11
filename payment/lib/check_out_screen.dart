import 'dart:html';

import 'package:flutter/material.dart';

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool inProgress = false;
  PaymentType selectedPaymentType = PaymentType.card;

  Future<void> pay() async {
    setState(() {
      inProgress = true;
    });
    final ClientSecret =
        await fetchPaymentIntentClientSecret[selectedPaymentType];

    await initializePaymentSheet(ClientSecret);

    await confirmPaymentSheet();
    setState(() {
      
    });
  }
}
