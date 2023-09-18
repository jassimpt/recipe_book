import 'package:flutter/material.dart';

import 'package:recipe_book/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboardingpage(),
      title: 'Recipe Book',
      debugShowCheckedModeBanner: false,
    );
  }
}