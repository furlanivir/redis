import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'package:provider/provider.dart';
import 'package:redis/database/database.dart';
import 'package:redis/modules/methods.dart';
import 'package:redis/repository/DataBaseRepository.dart';
import 'package:redis/screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorDatabaseRedis.databaseBuilder('database_redis.db').build();
  final databaseRepository = DataBaseRepository(database: database);

  runApp(ChangeNotifierProvider<DataBaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  )); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Exchange(),
    child: MaterialApp(
      title: 'Welcome to Flutter',
      home: SplashScreen(),    
      ));
  }
}