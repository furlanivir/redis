import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'Questionnaire.dart';
import 'package:redis/screens/WeekResults.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Results extends StatefulWidget {
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  
  @override
  Widget build(BuildContext context) {
    double mean_score = Provider.of<Exchange>(context).mean_score;
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(63, 4, 213, 1),
          
          title: const Text('Results',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 190, 161, 234),),),
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
            )),

            child: Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text(
                  "mean_results = $mean_score",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
              )),
            ],)
          ),
          
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color.fromRGBO(106, 128, 237, 1),
            color: const Color.fromRGBO(86, 86, 213, 1),
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) => {
              if (index==0){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const WeekResults()))),},
              if(index==1){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => HomePage()))),},
              if(index==2){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => Results()))),}
            } ,
            
            items: const [
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
      ])
    );
  }
}