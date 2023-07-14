import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'package:redis/repository/DataBaseRepository.dart';
import 'DailyResultsInfo.dart';
import 'DailyGraph.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Results extends StatefulWidget{

  @override
  State<Results> createState()=>_ResultsState();
}

class _ResultsState extends State<Results>{

  _getTodayData(day) async{
    final _todayData = await Provider.of<DataBaseRepository>(context).findAllDayData(day);
    return _todayData;
  }
  
  @override
  Widget build(BuildContext context){
    //double mean_score = Provider.of<Exchange>(context).mean_score;
    String today = Provider.of<Exchange>(context).today;
    print(today);
    List<SleepData> todayData =_getTodayData(today); //DA SISTEMARE !!!!!

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 86, 184, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
        title: const Text('Did you sleep well?', style: 
          TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 25,color:Color.fromARGB(255, 190, 161, 234))
        ),
        actions: [
          IconButton(onPressed: ()=>Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ResultsInfo()))),
           icon: Icon(Icons.question_mark_rounded))
        ],
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
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Check your sleep data:',style: TextStyle(color: Color.fromARGB(255, 190, 161, 234),fontSize: 20)),
                    BarChartSample(),
                    Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 5,vertical: 4), 
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Text('You slept a total of 9 hours (METTERE DATI)'),
                          Text('Sleep Stages: '),
                          Text('Deep: '),
                          Text('Rem: '),
                          Text('Wake: '),
                          Text('Your overall sleep score was: '),
                          Text('INSERIRE COMMENTO SE I DATI SONO BUONI O MENO'),
                        ],
                      )
                    ),
                  ],
                )
              )
            ])            
          ),
      bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color.fromRGBO(106, 128, 237, 1),
            color: const Color.fromRGBO(86, 86, 213, 1),
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) => {}/*
              if (index==0){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const WeekResults()))),},
              if(index==1){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => HomePage()))),},
              if(index==2){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => Results()))),}
            } */,
            
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