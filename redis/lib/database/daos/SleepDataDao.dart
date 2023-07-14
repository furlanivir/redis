import 'package:redis/database/entities/SleepData.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class SleepDataDao {

  //Query #1: SELECT columns
  @Query('SELECT duration FROM SleepData')
  Future<List<double>> findAllDuration();
  @Query('SELECT efficiency FROM SleepData')
  Future<List<int>> findAllEfficiency();
  @Query('SELECT deep FROM SleepData')
  Future<List<int>> findAllDeep();
  @Query('SELECT rem FROM SleepData')
  Future<List<int>> findAllRem();
  @Query('SELECT wake FROM SleepData')
  Future<List<int>> findAllWake();
  @Query('SELECT quiz FROM SleepData')
  Future<List<double>> findAllQuiz();

  @Query('SELECT * FROM SleepData WHERE date = :day')
  Future<List<SleepData?>> findAllDayData(String day);

  //Query #2: INSERT -> this allows to add a SleepData in the table
  @insert
  Future<void> insertSleepData(SleepData sleepData);

  //Query #3: DELETE -> this allows to delete a SleepData from the table
  @delete
  Future<void> deleteSleepData(SleepData sleepData);

  // Query #4: UPDATE rows
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSleepData(SleepData sleepData);

  // Query #5: UPDATE the Quiz value 
  @Query('UPDATE SleepData SET quiz = :score WHERE date = :day')
  Future<void> updateQuizScoreByDate(double score, String day);

}//SleepDataDao