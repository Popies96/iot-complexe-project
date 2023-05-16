import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:iot_project/Models/current_weather_model.dart';
class WeatherData {
  

  Future <Weather> getData (String city) async {
    final uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=94a0a72807ec4fcaa8915900230804&q=$city&aqi=no');
    final response = await http.get(uriCall);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200){
      
    return Weather.fromJason(body);}
    else {throw Exception('can not get weather');}
  }
}