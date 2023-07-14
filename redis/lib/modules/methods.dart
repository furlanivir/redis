
import 'package:floor/floor.dart';
import 'package:redis/database/database.dart';
import 'package:redis/database/entities/SleepData.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/SplashScreen.dart';
import 'package:redis/utils/impact.dart';
import 'package:redis/modules/obtainData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:redis/repository/DataBaseRepository.dart';
import 'package:provider/provider.dart';



class Methods extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<dynamic> result;
    SleepData values = SleepData('', 0, 0, 0, 0, 0, 0);

    final Today = DateTime.now();
    final dateTime = Today.subtract(Duration(days:12));
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormatter.format(dateTime);
    final day = formattedDate.toString();
    //print('ho ottenuto il giorno: $day');
    Provider.of<Exchange>(context, listen: false).getDay(day);

    _authorize() async {
      //Create the request
      final url = Impact.baseUrl + Impact.tokenEndpoint;
      final body = {'username': Impact.username, 'password': Impact.password};

      //Get the response
      //print('Calling authorize: $url');
      final response = await http.post(Uri.parse(url), body: body);

      //If 200, set the token
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final sp = await SharedPreferences.getInstance();
        sp.setString('access', decodedResponse['access']);
        sp.setString('refresh', decodedResponse['refresh']);
      } //if

      //Just return the status code 
      return response.statusCode;
    }   //_authorize

    _refreshTokens() async {

      //Create the request
      final url = Impact.baseUrl + Impact.refreshEndpoint;
      final sp = await SharedPreferences.getInstance();
      final refresh = sp.getString('refresh');
      final body = {'refresh': refresh};

      //Get the respone
    
      final response = await http.post(Uri.parse(url), body: body);
      print('Calling refresh: $url');
    
      //If 200 set the tokens
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final sp = await SharedPreferences.getInstance();
        sp.setString('access', decodedResponse['access']);
        sp.setString('refresh', decodedResponse['refresh']);
      }//if

      //Return just the status code
    
      return response.statusCode;

    } //_refreshTokens

    _requestData() async {
    //Initialize the result
    
      //Get the stored access token (Note that this code does not work if the tokens are null)
      final sp = await SharedPreferences.getInstance();
      var access = sp.getString('access');
  

      //If access token is expired, refresh it
      if(JwtDecoder.isExpired(access!)){
        await _refreshTokens();
        access = sp.getString('access');
      }//if
      

      //Create the (representative) request
      final url = Impact.baseUrl + Impact.sleepEndpoint + Impact.patientUsername + '/day/$day/';
      final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};
    
      //Get the response
      //print('Calling data: $url');
      final response = await http.get(Uri.parse(url), headers: headers);
    
      //if OK parse the response, otherwise return null
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        result = [];
        //print(response.statusCode);
        final control = decodedResponse['data'].toString();
        if(control=='[]'){
          values = SleepData(day, 0, 0, 0, 0, 0, 0);
          //print('non li ha caricati');
        }else{

          result.add(ObtainData.fromJson(decodedResponse['data']['date'], decodedResponse['data']['data'][0]));

          var DateofData = result[0].time;
          print(DateofData);
          for (var obtainData in result) {
            print('Time: ${obtainData.time}');
            print('Duration: ${obtainData.valueDuration}');
            print('Efficiency: ${obtainData.valueEfficiency}');
            print('Deep: ${obtainData.valueDeep}');
            print('REM: ${obtainData.valueRem}');
            print('Wake: ${obtainData.valueWake}');
          }

          String dateString = result[0].time.toString();
          for (var obtainData in result) {
            values = SleepData(dateString,obtainData.valueDuration,obtainData.valueEfficiency,obtainData.valueDeep,obtainData.valueRem,obtainData.valueWake,1);
          }
        }

      }//if
      else{
        values = SleepData(day, 0, 0, 0, 0, 0, 0);
        //print('dati nulli');
      }//else

      await Provider.of<DataBaseRepository>(context, listen: false).insertSleepData(values);
      print('Sleep data inserted successfully!');


      //Return the result
      return values;

    } //_requestData


    Future<bool> isInstancePresent(String day) async {
      final sleepDataList = await Provider.of<DataBaseRepository>(context, listen: false).findAllDayData(day);
      //print('the list is: ${sleepDataList[0]!.quiz}');

      final isPresent = sleepDataList.isNotEmpty;
      //print('ho isPresent lol: $isPresent');
      return isPresent;
    }

    isInstancePresent(day).then((isPresent) {
      if (isPresent) {
        return Container(
          child: MaterialApp(
            home: SplashScreen(),
          ),
        );
      } else {
        _authorize().then((_) {
          _requestData();
        });
      }
    });

    return Container(
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  } 
}

