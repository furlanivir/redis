import 'package:flutter/material.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'package:redis/repository/DataBaseRepository.dart';
import 'DailyResultsInfo.dart';
import 'DailyGraph.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
        Text('Your addictions affected your sleep in fact you had poor results',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Try reducing excess alcohol and smoking to sleep better.', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        Text('For more information click on the button in the upper right corner', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
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
        Text('Wow! Your sleep gives excellent results! You will notice benefits already! ',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Keep limiting alcohol and smoking, you are on the right track', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        Text('For more information click on the button in the upper right corner', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
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
        Text('Attention! Your sleep may be affected by the excesses of these days.',
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('To maintain a good level of sleep, try to reduce excesses', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        Text('For more information click on the button in the upper right corner', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
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
        Text("You didn't sleep well did you? But don't give up, soon your efforts will be rewarded by a good night's sleep ",
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),
        Text('Keep reducing the excesses!', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        Text('For more information click on the button in the upper right corner', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
      ]
      )
    );
  }

  Container bannerZERO(){
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
        borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(97, 36, 141, 1),
        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,1))]),
      child: const Column(children:[
        Text("There is no sleep data for today! Please come back tomorrow when you have uploaded the data ",
        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),
        fontSize: 22,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),
        SizedBox(height: 8),Text('For more information click on the button in the upper right corner', style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1), 
        fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
      ]
      )
    );
  }

  @override
  Widget build(BuildContext context){
   
    final dur=double.parse((todayData[0]!.duration.toInt()/(3.6*1000000)).toStringAsFixed(2)); //hours
    final deep =double.parse((todayData[0]!.deep!/(60)).toStringAsFixed(2)); //hours
    final rem = double.parse((todayData[0]!.rem!/(60)).toStringAsFixed(2)); //hours
    final wake = double.parse((todayData[0]!.wake!/(60)).toStringAsFixed(2)); //hours
    final score = todayData[0]!.efficiency;
    double quiz = Provider.of<Exchange>(context, listen: false).mean_score;
    double? refRemMin = dur*19/100;
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Color.fromRGBO(215, 223, 255, 1))),
        title: const Text('Daily sleep results', style: 
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
          image: DecorationImage(
            image: AssetImage('assets/images/sfondo.jpg'),
            fit: BoxFit.cover,
            opacity: 0.9,
          )),

            child: Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Check your sleep data:',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 20)),
                    BarChartSample(dur,deep,rem,wake,score),
                    Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 2), 
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Sleep efficiency: $score%',style: 
                          TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight:FontWeight.bold ),),
                          SizedBox(height: 30),
                          Container(
                            child: dur==0 ? (bannerZERO()) :
                            (((score!<92 && quiz>=4)||(rem<refRemMin && quiz>=4)) ? (bannerBB()): 
                              ((score>=92 && quiz<4) ? (bannerGG()) :  
                                (((score<92 && quiz<4)||(rem<refRemMin&&quiz>=4))? (bannerBG()) :
                                  (bannerGB())
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
    );
  }
}