import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboardingScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboardingscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
