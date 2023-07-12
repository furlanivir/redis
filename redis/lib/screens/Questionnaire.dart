import 'package:flutter/material.dart';


class Questionnaire extends StatefulWidget {
  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  //define the datas


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(63, 4, 213, 1),
      
          title: const Text('Questionnaire',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 190, 161, 234),),),
        ));
  }
}