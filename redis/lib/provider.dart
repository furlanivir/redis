import 'package:flutter/material.dart';

class Exchange extends ChangeNotifier{
  String email='';
  String password='';
  int testScore = 0;

  void sendUser(String data){
    email=data;
    notifyListeners();
  }

  void sendPsw(String data){
    password=data;
    notifyListeners();
  }

  void sendTestScore(int score){
    testScore = score;
    notifyListeners();
  }

}
