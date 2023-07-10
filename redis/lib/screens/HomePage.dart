//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Questionnaire.dart';
//import 'LoginPage.dart';
//import 'Settings.dart';
//import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routename='HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(63, 4, 213, 1),
          //title: const Text('HomePage'), centerTitle: true, 
          actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.person))],
          title: Container(child: Image.asset('assets/images/pittogramma.png'), height: 100),
        ),

        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Color.fromRGBO(142, 156, 223, 1)),
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
                          padding: const EdgeInsets.fromLTRB(10,15,10,15),
                          child:Padding( padding: const EdgeInsets.symmetric(),
                            child: Column( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(child:Column(children:[
                                    Center(child:
                                      Padding(padding: const EdgeInsets.all(5),
                                      child: Image.asset('assets/images/puzzle.png'))
                                      ),
                                    Text(
                                      "Quiz",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                        fontWeight: FontWeight.w600,
                                    )),
                                    ]),
                                     style: ElevatedButton.styleFrom(
                                      side: BorderSide(width: 3, color: Color.fromARGB(255, 245, 228, 248)),
                                      backgroundColor: Color.fromRGBO(165, 142, 223, 0.153),
                                      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(26))),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: ((context) => Questionnaire())));
                                    },
                                  )]       
                        ))),
                        Row(children: [
                          Column(
                            children:[Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                //alignment: Alignment.center,
                                width: 200,
                                padding: const EdgeInsets.fromLTRB(10,15,10,15),
                                child:Padding( padding: const EdgeInsets.symmetric(),
                                  child: Column( 
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton(child:Column(children:[
                                          Center(child:
                                            Padding(padding: const EdgeInsets.all(5),
                                            child: Image.asset('assets/images/calendario1.png'))
                                            ),
                                          Text(
                                            "Results",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600,
                                          )),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(width: 3, color: Color.fromARGB(255, 245, 228, 248)),
                                            backgroundColor: Color.fromRGBO(165, 142, 223, 0.153),
                                            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(26))),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: ((context) => Questionnaire())));
                                          },
                                        )]       
                              )))])]),
                          Column(
                            children:[Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                //alignment: Alignment.center,
                                width: 200,
                                padding: const EdgeInsets.fromLTRB(10,15,10,15),
                                child:Padding( padding: const EdgeInsets.symmetric(),
                                  child: Column( 
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        ElevatedButton(child:Column(children:[
                                          Center(child:
                                            Padding(padding: const EdgeInsets.all(5),
                                            child: Image.asset('assets/images/trend.png'))
                                            ),
                                          Text(
                                            "Trend",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600,
                                          )),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(width: 3, color: Color.fromARGB(255, 245, 228, 248)),
                                            backgroundColor: Color.fromRGBO(165, 142, 223, 0.153),
                                            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(26))),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: ((context) => Questionnaire())));
                                          },
                                        )]       
                              ))),
                            ],
                          )])
                        ])
                      ]
                    )),
        
        /*bottomNavigationBar: CurvedNavigationBar(
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
        ]),*/
              
      );
  }
}