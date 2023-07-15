import 'legend_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'package:redis/repository/DataBaseRepository.dart';


class WeekResultsSleep extends StatefulWidget{

  @override
  State<WeekResultsSleep> createState()=> _WeekResultsSleepState();
}

class _WeekResultsSleepState extends State<WeekResultsSleep> {

  List<int?> deep = [];
  List<int?> rem = [];
  List<int?> wake = [];
  List<double?> dur = [];

  @override
  void initState() {
    super.initState();
    _loadWeekData();
  }

  Future<void> _loadWeekData() async {
    deep = await Provider.of<DataBaseRepository>(context, listen: false).findAllDeep();
    rem = await Provider.of<DataBaseRepository>(context, listen: false).findAllRem();
    wake = await Provider.of<DataBaseRepository>(context, listen: false).findAllWake();
    dur = await Provider.of<DataBaseRepository>(context, listen: false).findAllDuration();
    setState(() {}); // Trigger a rebuild after loading the data
  }


  final deepColor = const Color(0xFF50E4FF);
  final remColor = const Color.fromARGB(255, 197, 235, 83);
  final wakeColor = const Color.fromARGB(255, 249, 80, 255);
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double? deep,
    double? wake,
    double? rem,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: deep!.toDouble(),
          color: deepColor,
          width: 7,
        ),
        BarChartRodData(
          fromY: deep + betweenSpace,
          toY: deep + betweenSpace + wake!.toDouble(),
          color: wakeColor,
          width: 7,
        ),
        BarChartRodData(
          fromY: deep + betweenSpace + wake + betweenSpace,
          toY: deep + betweenSpace + wake + betweenSpace + rem!.toDouble(),
          color: remColor,
          width: 7,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromRGBO(215, 223, 255, 1));
    String text;
    switch (value) {
      case 0:
        text = 'Day 1';
        break;
      case 1:
        text = 'Day 2';
        break;
      case 2:
        text = 'Day 3';
        break;
      case 3:
        text = 'Day 4';
        break;
      case 4:
        text = 'Day 5';
        break;
      case 5:
        text = 'Day 6';
        break;
      case 6:
        text = 'Day 7';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  _showQuestionDialog(){
    return AlertDialog(
      title: const Text("According to the guidelines for good health, they should be, compared to the total sleep duration: \n - deep: 10-12% \n - wake: 0-9% \n - rem: 19-27%", 
        style: TextStyle(
          color: Color.fromRGBO(32, 12, 75, 1),
          fontSize: 25,
          fontWeight: FontWeight.w600,
      ))
    );}

  @override
  Widget build(BuildContext context) {
    List<double?> weekDeep =  [0, 0, 0, 0, 0, 0, 0];
    List<double?> weekRem = [0, 0, 0, 0, 0, 0, 0];
    List<double?> weekWake = [0, 0, 0, 0, 0, 0, 0];
    int n = deep.length;
    if (n>=7) {for (int i = 0; i<7; i++){
      if(deep[n-1-i]==0){
        weekDeep[i] = 0.0;
        weekRem[i] = 0.0;
        weekWake[i] = 0.0;
      }else{
        weekDeep[i] = double.parse(((deep[n-1-i]!*100)/(dur[n-1-i]!/60000)).toStringAsFixed(5));
        weekRem[i] = double.parse(((rem[n-1-i]!*100)/(dur[n-1-i]!/60000)).toStringAsFixed(5));
        weekWake[i] = double.parse(((wake[n-1-i]!*100)/(dur[n-1-i]!/60000)).toStringAsFixed(5));
      }
      }
      return 
      Scaffold(
      appBar:AppBar(
        backgroundColor:  Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromRGBO(215, 223, 255, 1),
          ),
        ),
        actions: [IconButton(onPressed: () => {showDialog(context: context, builder: (_) => _showQuestionDialog())}, icon: const Icon(Icons.question_mark, color:Color.fromRGBO(215, 223, 255, 1)))],
        title: const Text('WeeklyResults',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(215, 223, 255, 1),),),
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
       
          child: 
          Column(children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(30),
              child:const Padding( padding: EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text(
                      textAlign: TextAlign.center,
                      "How did you sleep this week?",
                      style: TextStyle(
                        color: Color.fromRGBO(215, 223, 255, 1),
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                )))]),
            )),
              
            const SizedBox(height: 5),
            
            Container(
              
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(17),
              child: 
                Padding(
                  padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        const SizedBox(height: 8),
                        LegendsListWidget(
                          legends: [
                            Legend('Deep', deepColor),
                            Legend('Wake', wakeColor),
                            Legend('Rem', remColor),
                          ],
                        ),
                        const SizedBox(height:60),
                        AspectRatio(
                          aspectRatio: 2,
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceBetween,
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(),
                                rightTitles: const AxisTitles(),
                                topTitles: const AxisTitles(),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitles,
                                    reservedSize: 30,
                                  ),
                                ),
                              ),
                              barTouchData: BarTouchData(enabled: true),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: true),
                              
                              barGroups: [
                                
                                generateGroupData(0, weekDeep[6], weekWake[6], weekRem[6]),
                                generateGroupData(1, weekDeep[5], weekWake[5], weekRem[5]),
                                generateGroupData(2, weekDeep[4], weekWake[4], weekRem[4]),
                                generateGroupData(3, weekDeep[3], weekWake[3], weekRem[3]),
                                generateGroupData(4, weekDeep[2], weekWake[2], weekRem[2]),
                                generateGroupData(5, weekDeep[1], weekWake[1], weekRem[1]),
                                generateGroupData(6, weekDeep[0], weekWake[0], weekRem[0]),
                            
                              ],
                              maxY: 100,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
            )
            ),
                    
            const SizedBox(height: 50),

            Container(
              width: 300,
              height: 48,
              child: ElevatedButton(
              child: const Text(
                "Home Page", 
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600)
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: const Color.fromARGB(255, 93, 129, 245),
                onPrimary: Color.fromRGBO(215, 223, 255, 1),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomePage()));
            })),
      ])));}
      else
      {return 
      Scaffold(
      appBar:AppBar(
        backgroundColor:  Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromRGBO(215, 223, 255, 1),
          ),
        ),
        actions: [IconButton(onPressed: () => {showDialog(context: context, builder: (_) => _showQuestionDialog())}, icon: const Icon(Icons.question_mark, color:Color.fromRGBO(215, 223, 255, 1)))],
        title: const Text('WeeklyResults',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(215, 223, 255, 1),),),
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
       
          child: 
          Column(children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(30),
              child:const Padding( padding: EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text(
                      textAlign: TextAlign.center,
                      "How did you sleep this week?",
                      style: TextStyle(
                        color: Color.fromRGBO(215, 223, 255, 1),
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                )))]),
            )),
              
            const SizedBox(height: 5),
            
            Container(
              
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(17),
              child: 
             Text('There is still too little data, check again later. \n\nIn the meantime, hold on, you will achieve the desired results!',
             style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(215, 223, 255, 1),
                    fontSize: 27,
                    fontWeight: FontWeight.w600))),

            const SizedBox(height: 50),

            Container(
              width: 300,
              height: 48,
              child: ElevatedButton(
              child: const Text(
                "Home Page", 
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600)
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: const Color.fromARGB(255, 93, 129, 245),
                onPrimary: Color.fromRGBO(215, 223, 255, 1),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomePage()));
            }))
          ])
                    
    ));}
}}

        