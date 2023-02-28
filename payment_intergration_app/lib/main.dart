import 'package:flutter/material.dart';
import 'package:payment_intergration_app/homepage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_live_51MgTytSBFYgXPIOlVJ51hbxhs41EBIsSOTjyTbXWnBWzrYIR46JtFeFnNj6JcvmgGV5y5STrKiMZTnQlCcEnzy3S00yjmoZKdr';
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterapp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
