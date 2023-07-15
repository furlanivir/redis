import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'package:redis/repository/DataBaseRepository.dart';
import 'DailyResultsInfo.dart';
import 'DailyGraph.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//A Page to visualize the daily results of the sleep session, with a check on the efficiency and the quiz score 
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
  
  // Box to display the message for the user to see 
  Container bannerBB(){
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
        borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(97, 36, 141, 1),
        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,1))]),
      child: const Column(children:[
        Text('Le tue dipendenze hanno influito sul tuo sonno, infatti hai avuto risultati scarsi',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Prova a ridurre gli eccessi per dormire meglio', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center)
      ]
      )
    );
  }

  Container bannerGG(){
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
        borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(97, 36, 141, 1),
        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,1))]),
      child: const Column(children:[
        Text('Wow! Il tuo sonno sta migliorando! Ottimi risultati',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Continua a contenere alcool e fumo, sei sulla strada giusta', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center)
      ]
      )
    );
  }

  Container bannerGB(){
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
        borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(97, 36, 141, 1),
        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,1))]),
      child: const Column(children:[
        Text('Attenzione! Il tuo sonno potrebbe risentire degli eccessi di questi giorni',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Per mantenere un buon livello di sonno, prova a ridurre gli eccessi', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center)
      ]
      )
    );
  }

  Container bannerBG(){
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
        borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(97, 36, 141, 1),
        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,1))]),
      child: const Column(children:[
        Text('Non hai dormito bene vero? Ma non mollare',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Continua a ridurre gli eccessi, e il tuo sonno migliorerà!', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center)
      ]
      )
    );
  }

  @override
  Widget build(BuildContext context){
    // dati in giuste unità 
    /*
    final dur=todayData[0]!.duration.toInt()/(3.6*1000000); //hours
    final deep =todayData[0]!.deep!/(60); //minutes
    final rem = todayData[0]!.rem!/(60); //minutes
    final wake = todayData[0]!.wake!/(60); //minutes
    final score = todayData[0]!.efficiency;
    double quiz = Provider.of<Exchange>(context, listen: false).mean_score;
    // percentuali riferimento 
    int? refDeepMin = dur*10/100;
    int? refDeepMax = dur*12/100;
    int? refRemMin = dur*19/100;
    int? refRemMax = dur*23/100;
    int? refWakeMax = dur*9/100;
    */
    final dur = 8.5;
    final deep = 0.01;
    final rem = 1.87;
    final wake = 0.68;
    final score = 60;
    double quiz = 5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 2, 63, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Color.fromRGBO(215, 223, 255, 1))),
        title: const Text('Did you sleep well?', style: 
          TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1))
        ),
        actions: [
          IconButton(onPressed: ()=>Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ResultsInfo(dur,deep,rem,wake,score,quiz)))),
           icon: const Icon(Icons.question_mark_rounded,color: Color.fromRGBO(215, 223, 255, 1),))
        ],
      ),
      body: 
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration:  const BoxDecoration(
              color: Color.fromRGBO(32, 12, 75, 1)
            ),

            child: Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Check your sleep data:',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 20)),
                    BarChartSample(dur,deep,rem,wake,score),
                    Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 2), 
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Sleep efficiency: $score%',style: 
                          TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight:FontWeight.bold ),),
                          SizedBox(height: 10),
                          Container(
                            child: (score<75 && quiz>=4) ? (bannerBB()): 
                                ((score>=75 && quiz<4) ? (bannerGG()) :  
                                ((score<75 && quiz<4)? (bannerBG()) :
                                  (bannerGB())
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
      /*bottomNavigationBar: CurvedNavigationBar(
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
      ])*/
    );
  }
}