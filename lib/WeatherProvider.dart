// // WeatherProvider.dart
// import 'package:flutter/material.dart';
// import 'package:weather_app/Models/forecastModel.dart';
// import 'package:weather_app/Models/weatherModel.dart';
// import 'package:weather_app/api.dart';

// class WeatherDataProvider with ChangeNotifier {
//   String location = 'New York'; // Default location
//   WeatherData? currentWeather;
//   List<ForecastData>? forecast;

//   Future<void> fetchData() async {
//     try {
//       final api = WeatherApi();
//       currentWeather = await api.getCurrentWeather(location);
//       forecast = await api.getForecast(location);
//       notifyListeners();
//     } catch (error) {
//       // Handle error
//     }
//   }

//   void setLocation(String newLocation) {
//     location = newLocation;
//     fetchData();
//   }
// }
