import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redis/screens/fadeanimation.dart';
import 'package:redis/screens/LoginPage.dart';
import 'package:redis/screens/SignupPage.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
          width: double.infinity,
          height:  MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sfondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Color.fromRGBO(215, 223, 255, 1),
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Reduce Dipendences and Increase Sleep with:",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), fontSize: 15),
                      )),
                ],
              ),
            
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))),
                  ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color.fromRGBO(142, 156, 223, 1),width: 3),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromRGBO(215, 223, 255, 1),
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Color.fromRGBO(142, 156, 223, 1),width: 3),
                              top: BorderSide(color: Color.fromRGBO(142, 156, 223, 1),width: 3),
                              left: BorderSide(color: Color.fromRGBO(142, 156, 223, 1),width: 3),
                              right: BorderSide(color: Color.fromRGBO(142, 156, 223, 1),width: 3),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          color: Color.fromRGBO(97, 36, 141, 0.6),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color.fromRGBO(215, 223, 255, 1),
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}