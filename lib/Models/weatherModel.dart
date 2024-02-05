class WeatherData {
  final double temperature;
  final int humidity;
  final double windSpeed;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherData.fromJson(Map<String, dynamic> map) {
    return WeatherData(
      temperature: map['main']['temp'].toDouble(),
      humidity: map['main']['humidity'],
      windSpeed: map['wind']['speed'].toDouble(),
    );
  }
}
