import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/forecastModel.dart';
import 'dart:convert';

import 'package:weather_app/Models/weatherModel.dart';

class WeatherApi {
  //
  Future<WeatherData> getCurrentWeather(String location) async {
    //
    String BaseUrl = dotenv.get("API_Host", fallback: "Unable to access host");
    String API_KEY =
        dotenv.get("API_Key", fallback: "Unable to access api key");
    print(API_KEY);
    String currentWeatherUrl =
        BaseUrl + "/data/2.5/weather?q=$location&appid=" + API_KEY;
    final response = await http.get(Uri.parse(currentWeatherUrl));

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load current weather data');
    }
  }

  Future<List<ForecastData>> getForecast(String location) async {
    String BaseUrl = dotenv.get("API_Host", fallback: "Unable to access host");
    String API_KEY =
        dotenv.get("API_Key", fallback: "Unable to access api key");
    String forecastUrl =
        BaseUrl + "/data/2.5/forecast?q=$location&appid=" + API_KEY;

    final response = await http.get(Uri.parse(forecastUrl));

    if (response.statusCode == 200) {
      final List<dynamic> forecastList = json.decode(response.body)['list'];
      // print(forecastList);
      return forecastList.map((item) => ForecastData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
