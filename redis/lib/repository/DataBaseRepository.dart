import 'package:redis/database/database.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:flutter/material.dart';

class DataBaseRepository extends ChangeNotifier{

  //The state of the database is just the AppDatabase
  final DatabaseRedis database;

  //Default constructor
  DataBaseRepository({required this.database});

  //This method wraps the findAllDuration() method of the DAO
  Future<List<double>> findAllDuration() async{
    final results = await database.sleepDataDao.findAllDuration();
    return results;
  }//findAllDuration

  //This method wraps the findAllEfficiency() method of the DAO
  Future<List<int>> findAllEfficiency() async{
    final results = await database.sleepDataDao.findAllEfficiency();
    return results;
  }//findAllEfficiency

  //This method wraps the findAllDeep() method of the DAO
  Future<List<int>> findAllDeep() async{
    final results = await database.sleepDataDao.findAllDeep();
    return results;
  }//findAllDeep

  //This method wraps the findAllRem() method of the DAO
  Future<List<int>> findAllRem() async{
    final results = await database.sleepDataDao.findAllRem();
    return results;
  }//findAllRem

  //This method wraps the findAllWake() method of the DAO
  Future<List<int>> findAllWake() async{
    final results = await database.sleepDataDao.findAllWake();
    return results;
  }//findAllWake

  //This method wraps the findAllQuiz() method of the DAO
  Future<List<double>> findAllQuiz() async{
    final results = await database.sleepDataDao.findAllQuiz();
    return results;
  }//findAllQuiz

  //This method wraps the findAllDayData() method of the DAO
  Future<List<SleepData?>> findAllDayData(day) async{
    final results = await database.sleepDataDao.findAllDayData(day);
    return results;
  }//findAllDayData

  //This method wraps the updateQuizScoreByDate() method of the DAO
  Future<void> updateQuizScoreByDate(double score, String day) async{
    final results = await database.sleepDataDao.updateQuizScoreByDate(score,day);
    return results;
  }//updateQuizScoreByDate

  //This method wraps the insertSleepData() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertSleepData(SleepData sleepData)async {
    await database.sleepDataDao.insertSleepData(sleepData);
    notifyListeners();
  }//insertSleepData

  //This method wraps the deleteSleepData() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> deleteSpleepData(SleepData sleepData) async{
    await database.sleepDataDao.deleteSleepData(sleepData);
    notifyListeners();
  }//deleteSleepData

  //This method wraps the updateSleepData() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> updateSleepData(SleepData sleepData) async{
    await database.sleepDataDao.updateSleepData(sleepData);
    notifyListeners();
  }//updateSleepData

  
}//DatabaseRepository