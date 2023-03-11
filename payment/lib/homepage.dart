import 'dart:html';
import 'check_out_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment gate")),
      body: Center(
        child: ElevatedButton(
          onPressed: pay,
          child: Text('Pay Amount'),
        ),
      ),
    );
  }

  
}
