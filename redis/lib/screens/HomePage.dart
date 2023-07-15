import 'package:flutter/material.dart';
import 'package:redis/screens/DailyResults.dart';
import 'package:redis/screens/Profile.dart';
import 'package:redis/screens/TestPage.dart';
import 'package:redis/screens/WeekResults.dart';
import 'Questionnaire.dart';
import 'LoginPage.dart';
import 'Settings.dart';



class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color.fromRGBO(32, 12, 75, 1),
        actions: [IconButton(onPressed: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()))}, icon: const Icon(Icons.person, color: Color.fromRGBO(215, 223, 255, 1)))],
        title: Container(child: Image.asset('assets/images/pittogramma.png'), height: 100),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(32, 12, 75, 1)),
              child: Container(child: Image.asset('assets/images/pittogramma.png'), height: 100),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Color.fromRGBO(32, 12, 75, 1)),
              title: Text('Logout', style:  TextStyle(color: Color.fromRGBO(32, 12, 75, 1),fontSize: 30)),
                  onTap: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()))
             ),
            ListTile(
              leading: Icon(Icons.settings, color: Color.fromRGBO(32, 12, 75, 1)),
              title: Text('Settings', style:  TextStyle(color: Color.fromRGBO(32, 12, 75, 1),fontSize: 30)),
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SettingsScreen()))
            )
          ],
        ),
      ),

        body: 
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration:  const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sfondo.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //: Alignment.center,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child:Padding( padding: const EdgeInsets.symmetric(),
                            child: Column( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    child:Column(children:[
                                    Center(child:
                                      Padding(padding: const EdgeInsets.all(3),
                                      child: Image.asset('assets/images/puzzle.png'))
                                      ),
                                    
                                    ]),
                                     style: ElevatedButton.styleFrom(
                                      side: BorderSide(width: 6, color: Color.fromRGBO(215, 223, 255, 1)),
                                      backgroundColor: Color.fromRGBO(97, 36, 141, 0.178),
                                      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(60))),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: ((context) => TestPage())));
                                    },
                                  ),
                                  ],       
                        ))),
                        Text(
                            "Quiz",
                            style: const TextStyle(
                            color: Color.fromRGBO(215, 223, 255, 1),
                            fontSize: 50,
                                        fontWeight: FontWeight.w600,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Column(
                            children: [
                              Container(
                                width: 200,
                                padding: const EdgeInsets.all(10),
                                child:Padding( padding: const EdgeInsets.symmetric(),
                                  child: 
                                        ElevatedButton(child:Column(children:[
                                          Center(child:
                                            Padding(padding: const EdgeInsets.all(7),
                                            child: Image.asset('assets/images/calendario1.png'))
                                            ),
                                          
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(width: 3, color: Color.fromRGBO(215, 223, 255, 1)),
                                            backgroundColor: Color.fromRGBO(97, 36, 141, 0.178),
                                            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(26))),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: ((context) => Results())));
                                          },
                                        ))), 
                                  Text(
                                            "Results",
                                            style: const TextStyle(
                                              color: Color.fromRGBO(215, 223, 255, 1),
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600,
                                          )),     
                      ]),
                          Column(
                            children: [
                              Container(
                                width: 200,
                                padding: const EdgeInsets.all(10),
                                child:Padding( padding: const EdgeInsets.symmetric(),
                                  child: 
                                        ElevatedButton(child:Column(children:[
                                          Center(child:
                                            Padding(padding: const EdgeInsets.all(7),
                                            child: Image.asset('assets/images/trend.png'))
                                            ),
                                          
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(width: 3, color: Color.fromRGBO(215, 223, 255, 1)),
                                            backgroundColor: Color.fromRGBO(97, 36, 141, 0.178),
                                            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(26))),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: ((context) => WeekResults())));
                                          },
                                        ))),       
                              
                              Text(
                                "Trend",
                                style: const TextStyle(
                                color: Color.fromRGBO(215, 223, 255, 1),
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              )),
                            ],
      )])])),
    );  
  }
}



        