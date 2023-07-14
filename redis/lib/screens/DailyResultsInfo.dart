import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'WeekResults.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ResultsInfo extends StatefulWidget {
  @override
  State<ResultsInfo> createState() => _ResultsInfoState();
}

class _ResultsInfoState extends State<ResultsInfo> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 86, 184, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
          title: const Text('Did you sleep well?', style: 
          TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 25,color:Color.fromARGB(255, 190, 161, 234))
          )
        ),

        body: 
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration:  const BoxDecoration(
              color: Color.fromRGBO(88, 86, 184, 1)
            ),
              /*
            image: DecorationImage(
              image: AssetImage('assets/images/sfondo.jpg'),
              fit: BoxFit.cover,
              opacity: 0.9,
            ))*/

            child: Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text(
                  "INFO SLEEP STAGES",
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
                MaterialPageRoute(builder: ((context) => WeekResults()))),}
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