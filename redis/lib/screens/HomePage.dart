//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'LoginPage.dart';
//import 'Settings.dart';
//import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routename='HomePage4';

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
                child: SafeArea(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50,50,50,50),
                            child: 
                              Container(
                                height: 300,
                                width: 300,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(165, 142, 223, 0.263),
                                  borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child:
                                      Padding(padding: const EdgeInsets.symmetric(),
                                      child: Image.asset('assets/images/puzzle.png'))
                                      ),
                                ]),
                          //onTap: ()=>_toQuiz(context),
                          )),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                          padding: const EdgeInsets.fromLTRB(2,10,10,10),
                            child: 
                              Container(
                                height: 200,
                                width: 200,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(165, 142, 223, 0.263),
                                  borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child:
                                      Padding(padding: const EdgeInsets.symmetric(),
                                      child: Image.asset('assets/images/trend.png'))
                                      ),
                                ]),
                            //onTap: ()=>_toTrend(context),
                          )),
                    ]),
                  Column(
                    children:[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,2,10),
                            child: 
                              Container(
                                height: 200,
                                width: 200,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(165, 142, 223, 0.263),
                                  borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child:
                                      Padding(padding: const EdgeInsets.symmetric(),
                                      child: Image.asset('assets/images/calendario1.png'))
                                      ),
                                ]),
                          //onTap: ()=>_toResults(context),
                          )),
                  ],)
        ])]),)),
        
        /*bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(106, 128, 237, 1),
          color: Color.fromRGBO(86, 86, 213, 1),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) => {} ,
          items: [
          Icon(
            Icons.timeline,
            color: Colors.white,
            ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ]),*/
              
      );
  }
}