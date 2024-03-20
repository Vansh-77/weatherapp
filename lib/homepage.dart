import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weatherService = WeatherService("5b6f4a495a77d63c902854f3efe107bf");
  Weather? _weather;

  fetchweather() async {
    List city = await _weatherService.getCurrentCity();
    String cityname = city[2];
    print("city name is ${cityname}");
    try {
      final weather = await _weatherService.getWeather(city);
      print(weather);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("aalo");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _weather?.cityName ?? "city...",
            style: const TextStyle(fontSize: 30),
          ),
          Text("${_weather?.temperature.round() ?? "0"}°C")
        ],
      ),
    ));
  }
}
