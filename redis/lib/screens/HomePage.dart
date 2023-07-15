import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:redis/screens/DailyResults.dart';
import 'package:redis/screens/WeekResults.dart';
import 'Questionnaire.dart';
//import 'LoginPage.dart';
import 'Settings.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

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
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.person, color: Color.fromRGBO(215, 223, 255, 1)))],
        title: Container(child: Image.asset('assets/images/pittogramma.png'), height: 100),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(215, 223, 255, 1)),
              child: Container(child: Image.asset('assets/images/pittogramma.png'), height: 100),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
                  //onTap: ()=>_toLoginPage(context),
             ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
                  //onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SettingsScreen()))
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
                                        MaterialPageRoute(builder: ((context) => Questionnaire())));
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
          bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(106, 128, 237, 1),
          color: Color.fromRGBO(86, 86, 213, 1),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) => {
            if(index==0){Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => Questionnaire()))),},
            if(index==1){Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => HomePage()))),},
            if(index==2){Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => Questionnaire()))),}
          } ,
          items: [
          Icon(
            Icons.timeline,
            color: Colors.white,
            ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.check_box,
            color: Colors.white,
          ),
        ]),
    );  
  }
}



        