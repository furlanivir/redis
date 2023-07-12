import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/Profile.dart';
import 'package:redis/screens/Welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Exchange(),
    child: MaterialApp(
      title: 'Welcome to Flutter',
      home: ProfileScreen()    
      ));
  }
}