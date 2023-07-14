class ObtainData{
  final dynamic time;
  final double valueDuration;
  final int valueEfficiency;
  final int valueDeep;
  final int valueRem;
  final int valueWake;

  ObtainData({required this.time, required this.valueDuration, required this.valueEfficiency, required this.valueDeep, required this.valueRem, required this.valueWake});

  ObtainData.fromJson(dynamic date, Map<String, dynamic> json) :

      time = date,
      valueDuration = json['duration'],
      valueEfficiency = json['efficiency'].toInt(),
      valueDeep = json['levels']['summary']['deep']['minutes'].toInt(),
      valueRem = json['levels']['summary']['rem']['minutes'].toInt(),
      valueWake = json['levels']['summary']['wake']['minutes'].toInt();
      
  List<dynamic> toList() {
    return [time, valueDuration, valueEfficiency,valueDeep,valueRem,valueWake];
  }
  
  
}
