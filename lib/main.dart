import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/premium.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premium Subscription Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Premium(),
    );
  }
}
