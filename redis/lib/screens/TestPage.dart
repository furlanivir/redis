import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'dart:async';
import 'dart:math';

import 'Questionnaire.dart';
import 'HomePage.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int timeLimit = 7; // Time limit for each guess in seconds
  int roundLimit = 10; // Number of rounds to play

  int score = 0;
  int timeLeft = 7;
  int roundsPlayed = 0;

  late Color nowColor;
  List<Color> tileColors = [];
  List<Color> tilesData = [];

  Random rnd = Random();
  late Timer timer;

  bool showPopup = true;
  bool gameStarted = false;

  @override
  void initState() {
    super.initState();

    initializeTileColors();

    nowColor = getRandomColor();
    tileColors.remove(nowColor);

    generateTilesData();

    timeLeft = timeLimit;
    score = 0;
    roundsPlayed = 0;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void initializeTileColors() {
    tileColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
  }

  Color getRandomColor() {
    return tileColors[rnd.nextInt(tileColors.length)];
  }

  void generateTilesData() {
    tilesData.clear();

    for (int i = 0; i < 9; i++) {
      tilesData.add(getRandomColor());
    }

    tilesData[rnd.nextInt(9)] = nowColor;

    tilesData.shuffle();
  }

  void startGame() {
    setState(() {
      gameStarted = true;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
        } else {
          timer.cancel();
          if (score < roundLimit) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(142, 156, 223, 1),
                  title: Text('TEST FAILED',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),),
                  content: Text('The time to select the right color tile has run out, return to the home screen.',
                              style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
                              textAlign: TextAlign.center),
                  actions: [
                    Center(child:ElevatedButton(
                      onPressed: () {
                        Provider.of<Exchange>(context,listen: false).sendTestScore(10);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(97, 36, 141, 1)),
                      child: Text('Home',style: TextStyle(fontSize: 20)),
                    ),),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(142, 156, 223, 1),
                  title: Text('TEST PASS',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),),
                  content: Text('Congratulations! You passed the test, you guessed all the boxes correctly. Proceed now with the questionnaire.',
                              style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
                              textAlign: TextAlign.center),
                  actions: [
                    Center(child:ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Questionnaire()),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(97, 36, 141, 1)),
                      child: Text('Questionnaire',style: TextStyle(fontSize: 20)),
                    ),),
                  ],
                );
              },
            );
          }
        }
      });
    });
  }

  void handleTileTap(int index) {
    if (!gameStarted) return;

    if (tilesData[index] != nowColor) {
      timer.cancel();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(142, 156, 223, 1),
            title: Text('TEST FAILED',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),),
            content: Text('You selected the wrong color, return to the home screen.',
                        style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
                        textAlign: TextAlign.center),
            actions: [
              Center(child:ElevatedButton(
                onPressed: () {
                  Provider.of<Exchange>(context,listen: false).sendTestScore(10);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(97, 36, 141, 1)),
                child: Text('Home',style: TextStyle(fontSize: 20)),
              ),),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      score++;
      roundsPlayed++;
      if (roundsPlayed == roundLimit) {
        timer.cancel();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(142, 156, 223, 1),
              title: Text('TEST PASS',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),),
              content: Text('Congratulations! You passed the test, you guessed all the boxes correctly. Proceed now with the questionnaire.',
                           style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
                           textAlign: TextAlign.center),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Questionnaire()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(97, 36, 141, 1)),
                  child: Text('Questionnaire',style: TextStyle(fontSize: 20)),
                ),
              ],
            );
          },
        );
        return;
      }

      tileColors.add(nowColor);
      nowColor = getRandomColor();
      tileColors.remove(nowColor);
      generateTilesData();
      timeLeft = timeLimit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Stack(
          children: [
            _buildGameContent(),
            if (showPopup) _buildPopup(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameContent() {
    return Column(
      children: [
        SizedBox(
          height: 230,
          child: Column(
            children: [
              Container(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Text(
                      '$timeLeft',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 130,
                      ),
                    ),
                  ),
                  Container(
                    height: 205,
                    width: 60,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Material(
                      type: MaterialType.card,
                      color: nowColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 400,
          height: 450,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: List.generate(9, (index) {
              return Center(
                child: Material(
                  type: MaterialType.card,
                  color: tilesData[index],
                  child: InkWell(
                    onTap: () => handleTileTap(index),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPopup() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(142, 156, 223, 1),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Test Rules',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 36, 141, 1)),
              ),
              SizedBox(height: 20),
              Text(
                'The objective of the test is to select the tile with the same color as the large square at the top. You have $timeLimit seconds for each of the ten guesses.',
               style: TextStyle(fontSize: 18,color: Color.fromRGBO(97, 36, 141, 1)),
               textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showPopup = false;
                    startGame();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(97, 36, 141, 1)),
                child: Text('START',
                            style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
