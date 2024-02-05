import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/LoginScreen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MyWeatherApp(),
  );
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: LoginScreen(),
    );
  }
}
