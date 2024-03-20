import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import '../model/weather_model.dart';

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apikey;
  WeatherService(this.apikey);
  Future<Weather> getWeather(List citycords) async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?lat=${citycords[0]}&lon=${citycords[1]}&appid=$apikey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load weather data");
    }
  }

  Future<List> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return [position.latitude, position.longitude, placemark[0].locality];
  }
}
