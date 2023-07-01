import 'package:flutter/material.dart';
import 'package:redis/screens/Profile.dart';
import 'ProfileModel.dart';
import 'Settings.dart';

class Result extends StatelessWidget{
  Model? model;
  Result({this.model});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 86, 184, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
            fit: BoxFit.cover,
            height: 60,
            )
          ],
        ),
      ),
      
      body: Container(
        decoration:  const BoxDecoration(
          //color: Color.fromRGBO(97, 36, 141, 1),
          gradient: LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(88, 86, 184, 1),Color.fromRGBO(38, 7, 75, 1)])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  width: 400, height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.15),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text('Name: ${model?.name}',style: TextStyle(color: Colors.white,fontSize: 18))
                )
             ]
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  width: 400, height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.15),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text('Surname: ${model?.surname}',style: TextStyle(color: Colors.white,fontSize: 18)),
                )
             ]
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  width: 400, height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.15),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text('Email address: ${model?.mail}',style: TextStyle(color: Colors.white,fontSize: 18)),
                )
             ]
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  width: 400, height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.15),
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text('Birthday: ${model?.birth}',style: TextStyle(color: Colors.white,fontSize: 18)),
                )
             ]
            ),
         
         
            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed:() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SettingsScreen())),
              child: const Text('Settings')),
              SizedBox(width:20),
              ElevatedButton(onPressed:() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen())),
              child: const Text('Change data'))
              ]
            )
          ],
        )
      ),
    );
  }
}