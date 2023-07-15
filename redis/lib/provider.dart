import 'package:flutter/material.dart';
import 'package:redis/database/daos/SleepDataDao.dart';
import 'package:redis/database/database.dart';

class Exchange extends ChangeNotifier{
  String email='';
  String password='';
  double mean_score = 0;
  String today='';

  void sendUser(String data){
    email=data;
    notifyListeners();
  }

  void sendPsw(String data){
    password=data;
    notifyListeners();
  }


  void getMeanScore(score){
    mean_score = score;
    notifyListeners();
  }

  void getDay(day){
    today = day;
    notifyListeners();
  }

 
}
