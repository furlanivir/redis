import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/fadeanimation.dart';
import 'LoginPage.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(97, 36, 141, 0.6),
                  Color.fromRGBO(142, 156, 223, 1),
                ],
                ),
              ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
        appBar: AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Color.fromRGBO(215, 223, 255, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color.fromRGBO(215, 223, 255, 1),
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account, It's free",
                        style: TextStyle(fontSize: 15, color: Color.fromRGBO(215, 223, 255, 1)),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.2, makeInput(label: "Email", controller: emailController)),
                  FadeAnimation(
                      1.3, makeInput(label: "Password", obscureText: true, controller: passwordController)),
                  FadeAnimation(1.4,
                      makeInput(label: "Confirm Password", obscureText: true, controller: confirmPasswordController)),
                ],
              ),
              FadeAnimation(
                  1.5,
                  InkWell(
                    onTap: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;
                      if (password == confirmPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              email: email,
                              password: password,
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color.fromRGBO(215, 223, 255, 1),
                              title: Text("Password Error",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),
                                      textAlign: TextAlign.center,),
                              content: Text("Passwords do not match.",style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
                                      textAlign: TextAlign.center,),
                              actions: [
                                TextButton(
                                  child: Text("OK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),
                                      textAlign: TextAlign.center,),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      };
                      Provider.of<Exchange>(context,listen: false).sendUser(email);
                      Provider.of<Exchange>(context,listen: false).sendPsw(password);
                      },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(215, 223, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? "),
                      MaterialButton(
                      onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));  
                            },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget makeInput({label, obscureText = false, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Color.fromRGBO(215, 223, 255, 1)),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1),width: 2)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(97, 36, 141, 1))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}