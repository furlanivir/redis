import 'package:flutter/material.dart';
import 'package:redis/screens/Profile.dart';
import 'package:redis/screens/ProfileResult.dart';
import 'ProfileModel.dart';
import 'ProfileResult.dart';


class SettingsScreen extends StatelessWidget{
  
  SettingsScreen({Key? key}) : super(key: key);
  
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const Icon(Icons.brightness_medium_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
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
                          SizedBox(width: 10),
                          Icon(Icons.brightness_medium_rounded,color: Color.fromRGBO(174, 183, 227, 1),size: 40),
                          Text('  App Theme   ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                        ]
                      )
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen())),
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
                          Text('   Change    ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                      ])
                    ),
                  ),
                ]),
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Result())),
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
                          Text('   View    ',
                          style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 2,fontSize: 30,color:Color.fromRGBO(174, 183, 227, 1) ),
                          ),
                      ])
                    ),
                  ),
                   
                ])
            ],),
        )
      )
    );
  }
}

