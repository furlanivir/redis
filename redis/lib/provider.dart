import 'package:flutter/material.dart';

class Exchange extends ChangeNotifier{
  String email='';
  String password='';
  double mean_score = 0;

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
}
