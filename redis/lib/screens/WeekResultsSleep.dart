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

  @override
  void initState() {
    super.initState();
    _loadWeekData();
  }

  Future<void> _loadWeekData() async {
    deep = await Provider.of<DataBaseRepository>(context, listen: false).findAllDeep();
    rem = await Provider.of<DataBaseRepository>(context, listen: false).findAllRem();
    wake = await Provider.of<DataBaseRepository>(context, listen: false).findAllWake();
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
    const style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
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

  @override
  Widget build(BuildContext context) {
    int n = deep.length;
    print ('lunghezza :$n');
    return 
    Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromRGBO(63, 4, 213, 1),
          
        title: const Text('WeeklyResults',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 190, 161, 234),),),
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
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                )))]),
            )),
              
            const SizedBox(height: 20),
            
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
                        const SizedBox(height: 14),
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
                              barTouchData: BarTouchData(enabled: false),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              barGroups: [
                                
                                generateGroupData(0, deep[n-7], wake[n-7], rem[n-7]),
                                generateGroupData(1, deep[n-6], wake[n-6], rem[n-6]),
                                generateGroupData(2, deep[n-5], wake[n-5], rem[n-5]),
                                generateGroupData(3, deep[n-4], wake[n-4], rem[n-4]),
                                generateGroupData(4, deep[n-3], wake[n-3], rem[n-3]),
                                generateGroupData(5, deep[n-2], wake[n-2], rem[n-2]),
                                generateGroupData(6, deep[n-1], wake[n-1], rem[n-1]),
                            
                              ],
                              maxY: 300,
                            ),
                          ),
                        ),
                      ],
                    ),
            ):
             Text('There is still too little data, check again later. \n\nIn the meantime, hold on, you will achieve the desired results!',
             style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w600)),
            ),
                    
            const SizedBox(height: 70),

            Container(
              width: 300,
              height: 48,
              child: ElevatedButton(
              child: const Text(
                "Week Results", 
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600)
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: const Color.fromARGB(255, 93, 129, 245),
                onPrimary: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeekResults()));
            })),
        ])),

        bottomNavigationBar: CurvedNavigationBar(
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
    ]));
  }
}