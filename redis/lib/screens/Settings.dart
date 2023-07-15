import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/LoginPage.dart';
import 'package:redis/screens/Profile.dart';
import 'package:redis/screens/SignupPage.dart';
import 'SettingsCommunity.dart';
import 'SettingsFAQ.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

//Page with different settings 
class SettingsScreen extends StatefulWidget{
  String? name;
  String? surname;
  String? birthday;
  SettingsScreen({this.name,this.surname,this.birthday});
  @override
  SettingsScreenState createState()=>SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen>{
  bool checkValue = false;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
        title: const Text('Settings', style: 
          TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Colors.white)
        )
      ),
      body: Container(
        decoration:  const BoxDecoration(
          gradient:LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(32, 12, 75, 1),Color.fromRGBO(86, 54, 157, 1)])
        ),
        child: 
          Container(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Creation of the different settings 
                //Personal information
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [      
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen(
                        name: widget.name,
                        surname: widget.surname,
                        birthday: widget.birthday,))),
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/sfondo.jpg'),
                            fit: BoxFit.fill,
                          ),
                          ),
                          child: const Row(
                            children: [
                              Row(children: [
                                SizedBox(width: 15),
                                Icon(Icons.person_2_rounded,color: Color.fromRGBO(215, 223, 255, 1),size: 40),
                                Text(' Personal information  ',
                                style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1) ),)
                              ]),
                            ]
                          ),
                        ),
                      ),
                    ]
                  ),
                  const Row(children: [
                    SizedBox(width: 20),
                    Text('Change your name, surname, ...',style: TextStyle(
                      fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 15,color: Color.fromRGBO(215, 223, 255, 1)
                    ),)
                  ],) 
                ]
                ),

                //Community
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommunityScreen())),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/sfondo.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.language_rounded,color: Color.fromRGBO(215, 223, 255, 1),size: 40),
                            Text(' Community ',
                            style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1) ))
                          ]
                        )
                      ),
                    ),
                  ]),
                  const Row(children: [
                    SizedBox(width: 20),
                    Text('Find help, find a AA meeting, ...',style: TextStyle(
                      fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 15,color: Color.fromRGBO(215, 223, 255, 1)
                    ),)
                  ],)
                ]
                ),

                //FAQ 
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FAQScreen())),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/sfondo.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.question_mark_rounded,color: Color.fromRGBO(215, 223, 255, 1),size: 40),
                            Text(' FAQ ',
                            style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1) ))
                          ]
                        )
                      ),
                    ),
                  ]),
                  const Row(children: [
                    SizedBox(width: 20),
                    Text('All the answers about our application',style: TextStyle(
                      fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 15,color: Color.fromRGBO(215, 223, 255, 1)
                    ),)
                  ],)
                ]
                ),
              //Logout: Back to Sign up Page (forget the credentials)  
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => {
                      Provider.of<Exchange>(context,listen: false).sendUser(''),
                      Provider.of<Exchange>(context,listen: false).sendPsw(''),
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage())),
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.logout_rounded,color: Color.fromRGBO(215, 223, 255, 1),size: 40),
                          Text(' Logout ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1) ),
                          ),
                      ])
                    ),
                  ),
                ]),
            ],),
        )
      )
    );
  } 
}