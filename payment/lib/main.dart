import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'homepage.dart';

void main() async {
  Stripe.publishableKey =
      'pk_live_51MgTytSBFYgXPIOlVJ51hbxhs41EBIsSOTjyTbXWnBWzrYIR46JtFeFnNj6JcvmgGV5y5STrKiMZTnQlCcEnzy3S00yjmoZKdr';
  await Stripe.instance.applySettings;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
