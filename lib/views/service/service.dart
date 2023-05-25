import 'dart:convert';

import "package:http/http.dart" as http;
import '../model/weather.dart';

class CallToApi {
  final String apiKey = "e825e1f61a4b9cb346bd4096e5bdb9a6";

  Future<Weather> fetchWeather(String cityName) async {
    final weatherApiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final weatherResponse = await http.get(Uri.parse(weatherApiUrl));

    if (weatherResponse.statusCode == 200) {
      return Weather.fromJSON(jsonDecode(weatherResponse.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
