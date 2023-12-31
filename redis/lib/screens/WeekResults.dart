import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:redis/screens/WeekResultsSleep.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import '../repository/DataBaseRepository.dart';

class WeekResults extends StatefulWidget {
  const WeekResults({super.key});

  @override
  State<WeekResults> createState() => __WeekResultsState();
}

class __WeekResultsState extends State<WeekResults> {

  List<int?> eff = [];
  List<double?> quiz = [];

  @override
  void initState() {
    super.initState();
    _loadWeekData();
  }

  Future<void> _loadWeekData() async {
    eff = await Provider.of<DataBaseRepository>(context, listen: false).findAllEfficiency();
    quiz = await Provider.of<DataBaseRepository>(context, listen: false).findAllQuiz();
    setState(() {}); // Trigger a rebuild after loading the data
  }



  List<Color> gradientColors = [
    const Color(0xFF50E4FF),
    const Color(0xFF2196F3),
  ];

  
@override
  Widget build(BuildContext context) {
    int n = eff.length;
    return 
    Scaffold(
      appBar:AppBar(
        backgroundColor:  Color.fromRGBO(32, 12, 75, 1),
        actions: [IconButton(onPressed: () => {showDialog(context: context, builder: (_) => _showQuestionDialog())}, icon: const Icon(Icons.question_mark, color: Color.fromRGBO(215, 223, 255, 1)))],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
              builder: (context) =>  HomePage()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromRGBO(215, 223, 255, 1),
          ),
        ),
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
                    children: [
                      Center(child: Text(
                        textAlign: TextAlign.center,
                          "Hits of the week:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                          )
                  ))]),
              )),
              
              const SizedBox(height: 20),

              SizedBox(
                width:400, 
                child: n>=7?
                  Stack(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: LineChart(
                            mainData(eff, quiz),
                          ),
                        ),
                      ),
                    ],
              ):
              Text('There is still too little data, check again later. \n\nIn the meantime, hold on, you will achieve the desired results!',
                style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(215, 223, 255, 1),
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
              ),
              
              const SizedBox(height: 70),

              SizedBox(
                width: 300,
                height: 48,
                child: ElevatedButton(
                  child: const Text(
                    "Sleep Results", 
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600)
                  ),  //perchè di tipo int
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: const Color.fromARGB(255, 93, 129, 245),
                    onPrimary: Color.fromRGBO(215, 223, 255, 1),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  WeekResultsSleep()));
                  }
              )),

              const SizedBox(height: 50),

              const SizedBox(
                height: 48,
                child: Text(
                  "You are strong! Don't give up!", 
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(215, 223, 255, 1),
                    fontSize: 27,
                    fontWeight: FontWeight.w600)
                ),  //perchè di tipo int
              ),
        ])),
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromRGBO(215, 223, 255, 1),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;
      case 5:
        text = '5';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(eff, quiz) {
    int n = eff.length;
  
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: Colors.white10,
          strokeWidth: 1,
        );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, (5 * eff[n-7].toDouble()) / (100 * quiz[n-7])),
            FlSpot(1, (5 * eff[n-6].toDouble()) / (100 * quiz[n-6])),
            FlSpot(2, (5 * eff[n-5].toDouble()) / (100 * quiz[n-5])),
            FlSpot(3, (5 * eff[n-4].toDouble()) / (100 * quiz[n-4])),
            FlSpot(4, (5 * eff[n-3].toDouble()) / (100 * quiz[n-3])),
            FlSpot(5, (5 * eff[n-2].toDouble()) / (100 * quiz[n-2])),
            FlSpot(6, (5 * eff[n-1].toDouble()) / (100 * quiz[n-1])),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
            ),
          ),
        ),
      ],
    );
  }

  _showQuestionDialog(){
    return AlertDialog(
      title: const Text("In this graph you can see the trend of the results of the last week, obtained by comparing your answers to the daily test with the sleep data. \n\n\n 5 = GREAT JOB! \n 4 = KEEP IT UP! \n 3 = YOU ARE ON THE RIGHT TRACK \n 2 = YOU CAN IMPROVE \n 1 = THIS IS NOT GOOD", 
        style: TextStyle(
          color: Color.fromRGBO(32, 12, 75, 1),
          fontSize: 25,
          fontWeight: FontWeight.w600,
      )),
    );
  }
}