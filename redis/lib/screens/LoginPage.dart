import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/fadeanimation.dart';
import 'package:redis/screens/SignupPage.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final String? email;
  final String? password;

  LoginPage({this.email, this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
  super.initState();

    // Set the initial values of the text fields if provided from SignupPage
    _emailController.text = widget.email ?? '';
    _passwordController.text = widget.password ?? '';
  }

  void _login() {
  String email = _emailController.text;
  String password = _passwordController.text;

  // Validate the email and password
  if (email == Provider.of<Exchange>(context, listen: false).email && password == Provider.of<Exchange>(context, listen: false).password ) {
    // Clear the text fields after login
    _emailController.clear();
    _passwordController.clear();

    // Navigate to the next page after successful login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } 
  else {
    // Invalid credentials, display an error message or take appropriate action
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(215, 223, 255, 1),
          title: Text('Invalid Credentials',
               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),
               textAlign: TextAlign.center,),
          content: Text('Please enter valid email and password. If you are not registered please proceed with sign up.',
               style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
               textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
              child: Text('OK',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),
               textAlign: TextAlign.center,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color.fromRGBO(215, 223, 255, 1),
      appBar: AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(215, 223, 255, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromRGBO(97, 36, 141, 1),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sfondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 500, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(215, 223, 255, 1),
                        Color.fromRGBO(215, 223, 255, 0.45),
                      ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromRGBO(97, 36, 141, 1),
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Color.fromRGBO(97, 36, 141, 1)),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.2, makeInput(label: "Email",controller: _emailController,)),
                        FadeAnimation(1.3,
                            makeInput(label: "Password", obscureText: true,controller: _passwordController,)),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: _login,
                            color: Color.fromRGBO(97, 36, 141, 1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Color.fromRGBO(215, 223, 255, 1),
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                      1.5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? ",
                               style:TextStyle(color: Color.fromRGBO(97, 36, 141, 1))),
                          MaterialButton(
                            onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));  
                            },
                            child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color.fromRGBO(97, 36, 141, 1),
                                fontWeight: FontWeight.w600, fontSize: 18),),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.transparent,
                  /*decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.cover)),*/
                ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false,TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Color.fromRGBO(97, 36, 141, 1)),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(97, 36, 141, 1),width: 2)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}