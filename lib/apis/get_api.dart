// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:http/http.dart' as http;

class GetApis {
  // ignore: constant_identifier_names

  String API_KEY = dotenv.get("API_KEY");
  String API_URL = dotenv.get("API_URL");

  Future<WeatherModel> getWeatherForCity(String cityName) async {
    String BASEURL = "$API_URL?q=$cityName&appid=$API_KEY";

    try {
      var response = await http.get(Uri.parse(BASEURL));
      var decodedJson = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(decodedJson);
      return weatherModel;
    } catch (e) {
      rethrow;
    }
  }
}
