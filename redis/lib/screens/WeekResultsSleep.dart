import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'legend_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:redis/screens/WeekResults.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:redis/screens/DailyResults.dart';
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
    int? deep,
    int? wake,
    int? rem,
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
    switch (value.toInt()) {
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
      title: const Text("Press on the graph to see the percentages of your sleep stages. \n\nAccording to the guidelines for good health, they should be, compared to the total sleep duration: \n - deep: 10-12% \n - wake: 0-9% \n - rem: 19-27%", 
        style: TextStyle(
          color: Color.fromRGBO(32, 12, 75, 1),
          fontSize: 25,
          fontWeight: FontWeight.w600,
      ))
    );}

  @override
  Widget build(BuildContext context) {
    int n = deep.length;
    //print ('lunghezza :$n');
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
              child: n>=7?
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
                              barTouchData: BarTouchData(enabled: true, longPressDuration: const Duration(milliseconds: 100),),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              barGroups: [
                                
                                generateGroupData(0, ((deep[n-7]!*100)!/(dur[n-7]!/60000)).toInt(), ((wake[n-7]!*100)!/(dur[n-7]!/60000)).toInt(), ((rem[n-7]!*100)!/(dur[n-7]!/60000)).toInt()),
                                generateGroupData(1, ((deep[n-6]!*100)!/(dur[n-6]!/60000)).toInt(), ((wake[n-6]!*100)!/(dur[n-6]!/60000)).toInt(), ((rem[n-6]!*100)!/(dur[n-6]!/60000)).toInt()),
                                generateGroupData(2, ((deep[n-5]!*100)!/(dur[n-5]!/60000)).toInt(), ((wake[n-5]!*100)!/(dur[n-5]!/60000)).toInt(), ((rem[n-5]!*100)!/(dur[n-5]!/60000)).toInt()),
                                generateGroupData(3, ((deep[n-4]!*100)!/(dur[n-4]!/60000)).toInt(), ((wake[n-4]!*100)!/(dur[n-4]!/60000)).toInt(), ((rem[n-4]!*100)!/(dur[n-4]!/60000)).toInt()),
                                generateGroupData(4, ((deep[n-3]!*100)!/(dur[n-3]!/60000)).toInt(), ((wake[n-3]!*100)!/(dur[n-3]!/60000)).toInt(), ((rem[n-3]!*100)!/(dur[n-3]!/60000)).toInt()),
                                generateGroupData(5, ((deep[n-2]!*100)!/(dur[n-2]!/60000)).toInt(), ((wake[n-2]!*100)!/(dur[n-2]!/60000)).toInt(), ((rem[n-2]!*100)!/(dur[n-2]!/60000)).toInt()),
                                generateGroupData(6, ((deep[n-1]!*100)!/(dur[n-1]!/60000)).toInt(), ((wake[n-1]!*100)!/(dur[n-1]!/60000)).toInt(), ((rem[n-1]!*100)!/(dur[n-1]!/60000)).toInt()),
                            
                              ],
                              maxY: 100,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
            ):
             Text('There is still too little data, check again later. \n\nIn the meantime, hold on, you will achieve the desired results!',
             style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(215, 223, 255, 1),
                    fontSize: 27,
                    fontWeight: FontWeight.w600)),
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
        ])),

        /*bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromRGBO(106, 128, 237, 1),
          color: const Color.fromRGBO(86, 86, 213, 1),
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => {
            if(index==0){Navigator.push(
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
    ])*/);
  }
}