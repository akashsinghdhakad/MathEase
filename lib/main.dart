import 'package:flutter/material.dart';
import 'package:math_ease_calculator/theme/calculator_screen.dart';
import 'package:math_ease_calculator/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '(development) MathEase - Calculator',
      theme: AppThemeData.appThemeLight(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MathEase - Calculator'),
      // home: const TestWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CalculatorScreen();
  }
}
