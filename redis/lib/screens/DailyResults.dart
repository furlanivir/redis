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
  List<SleepData?> todayData = [SleepData('', 0, 0, 0, 0, 0, 0)];

  @override
  void initState() {
    super.initState();
    _loadTodayData();
  }

  Future<void> _loadTodayData() async {
    String today = Provider.of<Exchange>(context, listen: false).today;
    
    todayData = await Provider.of<DataBaseRepository>(context, listen: false).findAllDayData(today);
    setState(() {}); // Trigger a rebuild after loading the data
  }
  
  @override
  Widget build(BuildContext context){
    // dati in giuste unità 
    final dur=todayData[0]!.duration.toInt()~/(3.6*1000000);
    final deep =todayData[0]!.deep!~/(60);
    final rem = todayData[0]!.rem!~/(60);
    final wake = todayData[0]!.wake!~/(60);
    final score = todayData[0]!.efficiency;
    double quiz = Provider.of<Exchange>(context, listen: false).mean_score;
    // percentuali riferimento 
    int? refDeepMin = dur*10~/100;
    int? refDeepMax = dur*12~/100;
    int? refRemMin = dur*19~/100;
    int? refRemMax = dur*23~/100;
    int? refWakeMax = dur*9~/100;

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
                    BarChartSample(todayData[0]!.duration.toInt(),todayData[0]!.deep,todayData[0]!.rem,todayData[0]!.wake,todayData[0]!.efficiency),
                    Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 5,vertical: 4), 
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Text('You slept a total of ${(Duration(milliseconds: (todayData[0]!.duration.toInt()))).inHours.toString().padLeft(2, '0')}:'
                                                      '${((Duration(milliseconds: (todayData[0]!.duration.toInt()))).inMinutes % 60).toString().padLeft(2, '0')}:'
                                                      '${((Duration(milliseconds: (todayData[0]!.duration.toInt()))).inSeconds % 60).toString().padLeft(2,'0')}'),
                          Text('Sleep Stages: '),
                          Text('Deep: ${todayData[0]!.deep}'),
                          Text('Rem: ${todayData[0]!.rem}'),
                          Text('Wake: ${todayData[0]!.wake}'),
                          Text('Your overall sleep score was: ${todayData[0]!.efficiency}'),
                          Text('INSERIRE COMMENTO SE I DATI SONO BUONI O MENO'),
                          Container(
                            child: (score!<75 && quiz>=4) ? (Padding(padding: EdgeInsets.symmetric(), child: Column(
                                children: [Text('DORMITO MALE E TEST MALE')]))): 
                                ((score>=75 && quiz<4) ? (Padding(padding: EdgeInsets.symmetric(),child: Column( children: [
                                Text('DORMITO BENE E TEST BENE')]))) :  
                                ((score<75 && quiz<4)? (Padding(padding: EdgeInsets.symmetric(),child: Column(children: [
                                  Text('DORMITO MALE MA TEST BENE')]))) :
                                  (Padding(padding: EdgeInsets.symmetric(),child: Column(children: [
                                  Text('DORMITO BENE MA TEST MALE')]))
                                )
                                )
                                )
                          )
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