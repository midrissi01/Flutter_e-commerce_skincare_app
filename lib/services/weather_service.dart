import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/model/weather.dart';

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': '2a3c64e87bac47ac9de124119232905',
        'q': place,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch(e) {
      rethrow;
    }
  }
}
