import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/Models/forecastModel.dart';

class GraphDisplay extends StatelessWidget {
  final List<ForecastData>? forecastData;

  GraphDisplay({required this.forecastData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SfCartesianChart(
        title: ChartTitle(text: '5-Day Weather Forecast'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Date'),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Values'),
        ),
        series: [
          LineSeries<ForecastData, String>(
            dataSource: forecastData ?? [],
            xValueMapper: (ForecastData data, _) => data.date,
            yValueMapper: (ForecastData data, _) => data.temperature,
            name: 'Temperature',
            // markerSettings: MarkerSettings(isVisible: true),
            // dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
          LineSeries<ForecastData, String>(
            dataSource: forecastData ?? [],
            xValueMapper: (ForecastData data, _) => data.date,
            yValueMapper: (ForecastData data, _) => data.humidity,
            name: 'Humidity',
            // markerSettings: MarkerSettings(isVisible: true),
            // dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
          LineSeries<ForecastData, String>(
            dataSource: forecastData ?? [],
            xValueMapper: (ForecastData data, _) => data.date,
            yValueMapper: (ForecastData data, _) => data.windSpeed,
            name: 'Wind Speed',
            // markerSettings: MarkerSettings(isVisible: true),
            // dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
