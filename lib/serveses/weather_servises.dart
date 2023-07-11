import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '3677bed892474b30b7a122242220806';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
    Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}










/*
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class WeatherService
{
  String baseUrl="http://api.weatherapi.com/v1";
  String apiKey="a974f086218c48c1966144750230202";

  Future<WeatherModel?> getweather({required String cityName}) async{
    //WeatherModel? weather;
    try{
      //سؤال ازاي الكلاس دا قدرت اكسسه من غير http
      Uri url=Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String,dynamic>data= jsonDecode(response.body);
      /*
    var jsonData = data['forecast"]["forecastday'][0];
    WeatherModel weather =WeatherModel(
        data:data['location']['localtime'],
        maxTemp:jsonData['maxtemp_c'],
        minTemp:jsonData['mintemp_c'],
        temp:jsonData['avgtemp_c'] ,
        weatherStateName:jsonData['condition']['text']);
     */
      weather =WeatherModel.fromJson(data);


    }catch(e){
      print(e);
    }

    return weather;
  }
}
 */