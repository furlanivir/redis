import 'package:flutter/material.dart';
import 'package:redis/screens/Profile.dart';
class SettingsScreen extends StatefulWidget{
  String? name;
  String? surname;
  SettingsScreen({this.name,this.surname});
  @override
  SettingsScreenState createState()=>SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen>{
  bool checkValue = false;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(215, 223, 255, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pittogramma.png',
            fit: BoxFit.cover,
            height: 60,
            )
          ],
        ),
      ),
      body: Container(
        decoration:  const BoxDecoration(
          //color: Color.fromRGBO(97, 36, 141, 1),
          gradient: LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(215, 223, 255, 1),Color.fromRGBO(142, 156, 223, 1)])
        ),
        child: 
          Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Personal information
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen(
                      name: widget.name,
                      surname: widget.surname,
                    ))),
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        //borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.person_2_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                          Text(' Personal information ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                      ])
                    ),
                  ),
                ]),
              //Community
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    // DA IJMPLEMENTARE PAGINA COMMUNITY 
                    onTap: () => {},
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        //borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.language_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                          Text(' Community ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                      ])
                    ),
                  ),
                ]),
              //Notifications 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
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
                          SizedBox(width: 10),
                          Icon(Icons.alarm_add_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                          Text(' Notification ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                        ]
                      )
                    ),
                  ),
                  Checkbox(value: checkValue, onChanged: (bool? value){
                    setState((){
                      checkValue=value!;
                    });
                  },
                  activeColor: Colors.purple,
                  side: BorderSide(color: Colors.white,width: 3),
                  ),
                ],
              ),
              //Logout
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    // DA IMPLEMENTARE LOG OUT
                    onTap: () => {},
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        //borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sfondo.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.logout_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                          Text(' Logout ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
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