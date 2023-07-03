import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:redis/screens/Welcome.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/Splash.gif'), context);
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    });
    

    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Splash.gif'),
            fit: BoxFit.cover,
            opacity: 1,
          )),
        ), 
    );
  }
}
