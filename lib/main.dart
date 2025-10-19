import 'package:flutter/material.dart';
import 'package:project/features/auth/views/login_view.dart';
import 'package:project/features/auth/views/signup_view.dart';
import 'package:project/features/checkout/views/checkout.dart';
import 'package:project/root.dart';
import 'package:project/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}
