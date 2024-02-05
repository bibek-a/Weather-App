class ForecastData {
  final String date;
  final double temperature;
  final int humidity;
  final double windSpeed;

  ForecastData({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      date: json['dt_txt'],
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
