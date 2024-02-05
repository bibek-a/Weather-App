import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/GraphDisplay.dart';
import 'package:weather_app/Models/forecastModel.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/api.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController searchController = TextEditingController();
  String location = 'New York'; // Default location
  WeatherData? currentWeather;
  List<ForecastData>? forecast;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final api = WeatherApi();
      currentWeather = await api.getCurrentWeather(location);
      forecast = await api.getForecast(location);
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch weather data'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Current Weather Conditions in $location',
                style: TextStyle(fontFamily: "Nunito", fontSize: 17),
              ),
              currentWeather != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Temperature: ${currentWeather!.temperature}°C',
                            style:
                                TextStyle(fontFamily: "Nunito", fontSize: 17)),
                        Text('Humidity: ${currentWeather!.humidity}%',
                            style:
                                TextStyle(fontFamily: "Nunito", fontSize: 17)),
                        Text('Wind Speed: ${currentWeather!.windSpeed} m/s',
                            style:
                                TextStyle(fontFamily: "Nunito", fontSize: 17)),
                      ],
                    )
                  : Container(),
              SizedBox(height: 16),
              TextField(
                controller: searchController,
                decoration: InputDecoration(labelText: 'Search Location'),
              ),
              SizedBox(height: 16),
              CupertinoButton(
                color: Color.fromARGB(255, 220, 180, 215),
                onPressed: () {
                  setState(() {
                    location = searchController.text;

                    fetchData();
                  });
                },
                child: Text('Search',
                    style: TextStyle(fontFamily: "Roboto", fontSize: 17)),
              ),
              SizedBox(height: 16),
              Text(
                '5-Day Forecast',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    color: Colors.black),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
              GraphDisplay(forecastData: forecast),
              SizedBox(
                height: 5,
              ),
              forecast != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: forecast!.map((data) {
                        return Text(
                          '${data.date}' +
                              "\n" +
                              'Temperature: ${data.temperature}°C,' +
                              "\n" +
                              'Humidity: ${data.humidity}%' +
                              "\n" +
                              'Wind Speed: ${data.windSpeed} m/s' +
                              "\n",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              color: Colors.black),
                        );
                      }).toList(),
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
