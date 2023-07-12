import 'package:flutter/material.dart';

class Exchange extends ChangeNotifier{
  String email='';
  String password='';

  void sendUser(String data){
    email=data;
    notifyListeners();
  }

  void sendPsw(String data){
    password=data;
    notifyListeners();
  }

}
