import 'package:flutter/material.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:redis/screens/Questionnaire.dart';
//import 'package:redis_01/screens/HomePage.dart';
//import 'package:redis/screens/LoginPage.dart';
//import 'package:redis/screens/Settings.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Welcome to Flutter',
      home: Questionnaire()    
      );
  }
}